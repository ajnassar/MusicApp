module SessionsHelper
  def login_in_user(user)
    user.reset_session_token
    session[:session_token] = user.session_token
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    current_user == session[:session_token]
  end
end
