class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      p('LOGINFORMATION')
      log_in user
      remember user
      redirect_to user
    else
      p('LOGINFORMATION1')
      flash.now[:danger] = 'Invalid email/password combination' # Не совсем верно!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to home_path
  end
end
