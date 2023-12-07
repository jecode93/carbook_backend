class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user
  def login
    user = User.find_by(username: params[:username])

    if user
      token = encode_token(user_id: user.id)
      render json: { token: }
    else
      render json: { error: 'Invalid username' }, status: :unauthorized
    end
  end

  private

  def encode_token(payload)
    secret_key = ENV['JWT_SECRET_KEY'] || 'default_secret_key'
    JWT.encode(payload, secret_key, 'HS256')
  end
end
