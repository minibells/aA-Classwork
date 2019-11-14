require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize 
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
  attr_accessor :title, :body, :author_id, :question_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum) }
  end

  def self.find_by_id(question_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        question_id = ?
    SQL
    return nil unless question.length > 0
    Questions.new(question.first) 
  end

    def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0
    Questions.new(question.first) 
  end


  def initialize(options)
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
    @question_id = options['question_id']
  end

end

class Users
  attr_accessor :fname, :lname, :id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first) 
    end

    def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first) 
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end
end

class QuestionFollows
  attr_accessor :question_id, :user_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollows.new(datum) }
  end

  def self.find_by_id(question_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
    return nil unless follows.length > 0

    QuestionFollows.new(follows.first) 
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

class Replies
  attr_accessor :reply_id, :user_id, :parent_id, :body, :question_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_id(reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first) 
  end

  def self.find_by_user_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0
    Replies.new(reply.first) 
  end

    def self.find_by_question_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    Replies.new(reply.first) 
  end

  def initialize(options)
    @reply_id = options['reply_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @body = options['body']
    @question_id = options['question_id']
  end

  def author(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0
  end
end

class QuestionLikes
  attr_accessor :likes, :like_id, :liked_by
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def self.find_by_id(like_id)
    like = QuestionsDatabase.instance.execute(<<-SQL, like_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        like_id = ?
    SQL
    return nil unless like.length > 0

    QuestionLikes.new(like.first) 
  end

  def initialize(options)
    @likes = options['likes']
    @like_id = options['like_id']
    @liked_by = options['liked_by']
  end
end