# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  username    :string           not null
#  location_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true 
	validates :password_digest, presence: true
	validates :password, length: { minimum: 6 }, allow_nil: true # if @password is present (only when creating new user), should be at least 6 chars; if none is present (pulled from db), that's ok

  # # every time a user instance is initialized (.new), `ensure_session_token` will be called
	after_initialize :ensure_session_token
	
	# # why do we need this attr_reader? validations use getter methods under the hood
	attr_reader :password

  belongs_to :location,
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :Location
  # belongs_to adds presence-true validation on the foreign_key column

  has_many :drops,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :Drop

  def self.find_by_credentials(username, password)
		user = User.find_by(username: username)
		return nil unless user && user.is_password?(password)
		user
  end
  
  # # called whenever we initialize a user with new or create, with password as a key
  def password=(password)
    @password = password # need to set @password so it can be returned by the password getter method, which is used for the minimum length validation (don't worry, won't be stored in db)
    
		self.password_digest = BCrypt::Password.create(password)
		# here, BCrypt's `create` takes a plaintext password, salts and hashes it, and returns a digest
	end

  def is_password?(password)
		# self.password_digest is just a string, so we first convert it to a bcrypt object
		bc_password = BCrypt::Password.new(self.password_digest)
		bc_password.is_password?(password) 
		# here we use the BCrypt `is_password?`, an entirely different method from the one we're writing here 
  end
  
  def reset_session_token!
		self.session_token = self.class.generate_session_token
    self.save! # don't forget to save! the new session token needs to end up in the database
    
		# return the new session_token for convenience
		self.session_token
	end
	
  
  private

	def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

	def self.generate_session_token
		SecureRandom::urlsafe_base64
	end




  ##############################################################

  # # Demos from W5D5 ActiveRecord Queries lecture
  
  # def self.new_yorkers
  #   # return New Yorker's id and username....
  #   User
  #     .where(locations: {name: "New York, US"})
  #     .joins(:location)
  #     .select(:id, :username)
  #     # .where("locations.name = 'New York, US'") # check
  # end

  # def self.active_users
  #   # users who have more than or equal to 3 drops
  #   # return in an array with username and number of drops
  #   # drops in DESC order 
  #   # use COUNT(*) in sql string

  #   User.joins(:drops).group(:id).having("count(*) >= 3").order("count(*) DESC").pluck(:username, "count(drops.*)")
  # end

end
