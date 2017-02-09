require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL).first.map(&:to_sym)
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        0
    SQL
  end

  def self.finalize!
    columns.each do |col_name|
      define_method(col_name) do
        @attributes[col_name]
      end
      define_method("#{col_name}=") do |thing|
        attributes[col_name] = thing
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = #{id}
    SQL
    result.empty? ? nil : self.new(result.first)
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      self.send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    cols = self.class.columns.drop(1)
    col_names = cols.join(', ')
    question_marks = (["?"] * cols.length).join(', ')
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
      #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL
    @attributes[:id] = DBConnection.last_insert_row_id
  end

  def update
    cols = self.class.columns.drop(1)
    set_cols = cols.map { |attr_name| "#{attr_name} = ?" }.join(', ')
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), @attributes[:id])
      UPDATE
        #{self.class.table_name}
      SET
        #{set_cols}
      WHERE
        id = ?
    SQL
  end

  def save
    attributes[:id] ? update : insert
  end
end
