class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    unless session[:user_id]
    current_user ||= User.find_by(session[:user_id])
    end
  end
  helper_method :current_user
end
