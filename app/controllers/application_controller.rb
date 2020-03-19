class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def check_session

  @user_id=session[:user_id]
    if @user_id.present?
     else
      redirect_to root_path
    end

  end
  def check_setup
      @setup_id=session[:setup_id]
    if @setup_id.present?
     else
      redirect_to dashboards_path
    end
  end

end
