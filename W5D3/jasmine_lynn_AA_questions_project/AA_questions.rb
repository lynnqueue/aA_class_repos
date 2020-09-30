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

class Question 
    attr_accessor :title, :body, :id, :user_id

    def self.all #to generate a list of all the question instances
        results = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        results.map {|question| Question.new(question)}
    end 

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @title = options['title']
        @body = options['body']
    end 

    def self.find_by_id(id)
        #[{}...]
        q = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL
        raise "question doesn't exist" if q.length==0
        Question.new(q.first)
    end 

    def self.find_by_user_id(user_id)
        user_q = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT *
            FROM questions
            WHERE user_id = ?
        SQL
        raise "#{user_id} has no questions" if user_q.length==0
        # puts "#{user_id} quesions: "
        user_q.map {|quesion| Question.new(question)}
        #[question isnt, questioninst2]
    end 

    def author
        a= QuestionsDatabase.instance.execute(<<-SQL, @user_id) 
            SELECT *
            FROM users
            WHERE user_id = ?
        SQL
        User.new(a.first)
    end 

    def replies
        Reply.find_by_question_id(@id)
    end 

end 

class User 
    attr_accessor :fname, :lname, :id 

    def self.all #to generate a list of all the question instances
        results = QuestionsDatabase.instance.execute("SELECT * FROM users")
        results.map {|user| User.new(user)}
    end 

    def self.find_by_name(fname, lname)
        n = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT *
            FROM users
            WHERE fname = ? AND lname = ?
        SQL
        raise "user doesn't exist" if n.length==0
        User.new(n.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end 

    def authored_questions
        Question.find_by_user_id(@id)
    end 

    def authored_replies
        Reply.find_by_user_id(@id)
    end

end 

class Reply
    attr_accessor :question_id, :parent_id, :user_id, :top_level, :body, :id 

    # def self.all #to generate a list of all the question instances
    #     results = QuestionsDatabase.instance.execute("SELECT * FROM users")
    #     results.map {|user| User.new(user)}
    # end 

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @top_level= options['top_level']
        @body = options['body']
        @user_id = options['user_id']
    end 

    def self.find_by_user_id(user_id)
        user_r = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT *
            FROM replies
            WHERE user_id = ?
        SQL
        raise "#{user_id} has no replies" if user_r.length==0
        user_r.map {|reply| Reply.new(reply)}
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM replies
            WHERE question_id = ?
        SQL
        raise "#{question_id} has no replies" if replies.length==0
        replies.map {|reply| Reply.new(reply)}
    end 

    def author
        a = QuestionsDatabase.instance.execute(<<-SQL, @user_id)
            SELECT *
            FROM users
            WHERE user_id = ?
        SQL
        User.new(a.first)
    end 

    def question
        q = QuestionsDatabase.instance.execute(<<-SQL, @question_id)
            SELECT *
            FROM questions
            WHERE question_id = ?
        SQL
        Question.new(q.first)
    end 

    def parent_reply
        raise "#{id} has no parent" if @parent_id == NULL
        p = QuestionsDatabase.instance.execute(<<-SQL, @parent_id)
            SELECT *
            FROM replies
            WHERE parent_id = ?
        SQL
        Reply.new(p.first)
    end 

    def child_replies
        c = QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT *
            FROM replies
            WHERE parent_id = ?
        SQL
        raise "#{@id} has no replies" if c.length==0
        c.map {|reply| Reply.new(reply)}
    end

end 

