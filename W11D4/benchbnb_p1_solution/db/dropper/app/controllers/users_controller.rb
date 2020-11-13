class UsersController < ApplicationController
	def new
		render :new
	end

	def create
		@user = User.new(user_params)
		# @user = User.new(username: 'some_username', password: '123456')

		if @user.save # regular `save`, not `save!`
			# log the user in
			login!(@user)
			redirect_to drops_url
		else
			# let the user try again, but tell them what they got wrong
			flash.now[:errors] = @user.errors.full_messages
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end
end
