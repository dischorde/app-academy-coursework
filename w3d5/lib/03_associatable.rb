require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @primary_key = (options[:primary_key] ? options[:primary_key] : :id)
    @foreign_key = (options[:foreign_key] ? options[:foreign_key] : "#{name.to_s.singularize}_id".to_sym)
    @class_name = (options[:class_name] ? options[:class_name] : name.to_s.singularize.camelcase)
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @primary_key = (options[:primary_key] ? options[:primary_key] : :id)
    @foreign_key = (options[:foreign_key] ? options[:foreign_key] : "#{self_class_name.to_s.underscore}_id".to_sym)
    @class_name = (options[:class_name] ? options[:class_name] : name.to_s.singularize.camelcase)
  end
end

module Associatable
  # Phase IIIb

  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    assoc_options[name] = options
    define_method(name) do
      foreign_key_value = self.send(options.foreign_key)
      results = DBConnection.execute(<<-SQL, foreign_key_value)
        SELECT
          #{options.table_name}.*
        FROM
          #{options.table_name}
        JOIN
          #{self.class.table_name}
        ON
          #{options.table_name}.#{options.primary_key} = #{self.class.table_name}.#{options.foreign_key}
        WHERE
          #{self.class.table_name}.#{options.primary_key} = ?
        SQL
      results.empty? ? nil : options.model_class.new(results.first)
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self, options)
    define_method(name) do
      primary_key_value = self.send(options.primary_key)
      results = DBConnection.execute(<<-SQL, primary_key_value)
        SELECT
          #{options.table_name}.*
        FROM
          #{options.table_name}
        JOIN
          #{self.class.table_name}
        ON
          #{options.table_name}.#{options.foreign_key} = #{self.class.table_name}.#{options.primary_key}
        WHERE
          #{options.model_class.table_name}.#{options.foreign_key} = ?
        SQL
      results.empty? ? [] : results.map { |result| options.model_class.new(result) }
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
