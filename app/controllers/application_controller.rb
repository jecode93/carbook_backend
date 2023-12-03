class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  private

  def authenticate_user
    unless user_authenticated?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def user_authenticated?
    @current_user ||= find_current_user
    !@current_user.nil?
  end

  def find_current_user
    return nil unless request.headers['Authorization'].present?

    token = request.headers['Authorization'].split(' ').last
    payload = decode_token(token)
    User.find_by(id: payload['user_id'])
  rescue JWT::DecodeError
    nil
  end

  def decode_token(token)
    secret_key = ENV['JWT_SECRET_KEY'] || 'default_secret_key'
    JWT.decode(token, secret_key, true, algorithm: 'HS256').first
  end
end
