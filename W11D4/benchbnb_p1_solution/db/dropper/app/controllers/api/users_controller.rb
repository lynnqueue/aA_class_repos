class Api::UsersController < ApplicationController
    def index
        @users = User.all 

        render :index
    end
    
    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render :show
        else
            render json: @user.errors.full_messages, status: 422
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end