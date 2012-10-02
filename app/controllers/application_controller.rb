class ApplicationController < ActionController::Base
  protect_from_forgery

private
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def current_user?(user)
    user == current_user
  end

  helper_method :current_user, :current_user?

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
