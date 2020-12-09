class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user 
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_logged_in
    if logged_in? == false
      redirect_to 'sessions/new'
    end
  end
end
