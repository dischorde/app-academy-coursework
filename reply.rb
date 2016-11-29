class Reply
  attr_accessor :parent_id, :user_id, :question_id, :body
  attr_reader :id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if data.empty?
    Reply.new(data.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil if data.empty?
    Reply.new(data.first)

  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil if data.empty?
    Reply.new(data.first)
  end


  def initialize(options)
    @id = options['id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    data = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil if data.empty?
    Reply.new(data.first)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil if data.empty?
    Reply.new(data.first)
  end

  def save
    @id ? update : create
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @parent_id, @user_id, @body, @question_id, @id)
      UPDATE
        replies
      SET
        parent_id = ?, user_id = ?, body = ?, question_id = ?
      WHERE
        id = ?
    SQL
  end

  def create
    QuestionsDatabase.instance.execute(<<-SQL, @parent_id, @user_id, @body, @question_id)
      INSERT INTO
        replies (parent_id, user_id, body, question_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end


end
