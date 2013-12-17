module SessionsHelper
  def login_in_user(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to bands_url
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate
    redirect_to new_session_url unless logged_in?
  end
end
