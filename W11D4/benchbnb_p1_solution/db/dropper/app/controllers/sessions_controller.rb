class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		# find a user by their username and password
		user = User.find_by_credentials(
			params[:user][:username],
			params[:user][:password]
		)

		if user # a user with correct credentials was found
			# log the user in
			login!(user)
			# finish response
			redirect_to drops_url
		else # when user == nil
			flash.now[:errors] = ['Invalid credentials']
			render :new
			# redirect_to new_session_url # would essentially do same thing, but would initiate a new request-response cycle (so we'd use flash instead of flash.now)
		end
	end

	def destroy
		# log the user out
		logout!
		redirect_to new_session_url
	end

end
