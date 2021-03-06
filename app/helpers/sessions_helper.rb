module SessionsHelper
  # login
  def log_in(user)
    session[:user_id] = user.id
  end

  # remember user session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # return user for corresponding cookie
  def current_user
    if (user_id = session[:user_id])
      User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        user
      end
    end
  end

  # forget user
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logout user
  def log_out
    forget(current_user)
    session.delete(:user_id)
  end

  # return true when user logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end
end
