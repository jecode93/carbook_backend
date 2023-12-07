class UsersController < ApplicationController
  skip_before_action :authenticate_user

  def create
    User.find_by(username: user_params[:username])

    if @isUserPresent
      render json: { message: 'User is already present' }
    else
      user = User.new(user_params)

      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
