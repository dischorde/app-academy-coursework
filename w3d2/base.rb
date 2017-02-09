require "byebug"
class QuestionsBase

  attr_reader :id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    return nil if data.empty?
    self.new(data.first)
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL
    return nil if data.empty?
    data.map { |datum| self.new(datum) }
  end

  def attributes
    atr = {}
    self.instance_variables.each do |name|
      fixed_name = name.to_s[1..-1]
      atr[fixed_name] = instance_variable_get(name)
    end

    atr
  end

  def save
    @id ? update : create
  end

  def update
    set_attributes = attributes.keys
    set_attributes.delete("id")
    set_attributes = set_attributes.map { |key| "#{key} = ?" }.join(", ")
    QuestionsDatabase.instance.execute(<<-SQL, *attributes.values )
      UPDATE
        #{self.class.table}
      SET
        #{set_attributes}
      WHERE
        id = ?
    SQL
  end

  def create
    set_attributes = attributes
    set_attributes.delete("id")
    set_columns = set_attributes.keys.map { |key| "#{key}" }.join(", ")
    set_values = set_attributes.keys.map { |key| "?" }.join(", ")
    debugger
    QuestionsDatabase.instance.execute(<<-SQL, *set_attributes.values)
      INSERT INTO
        #{self.class.table}
        (#{set_columns})
      VALUES
        (#{set_values})
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end


end
