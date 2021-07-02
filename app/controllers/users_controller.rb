class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] ||= user.id 
            render json: user, status: :created
        else
            render json: {errors: user.errors}, status: :unprocessable_entity
        end
    end


    private

    def user_params
        params.permit(:username, :password_digest, :image_url, :bio)
    end
end
