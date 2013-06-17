class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :init_user

  helper_method :current_user
  helper_method :is_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin
  	@admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def init_user
  	if not current_user 
  		redirect_to root_path
  	end
  end

  def init_admin
  	if not is_admin
  		redirect_to root_path
  	end
  end

end
