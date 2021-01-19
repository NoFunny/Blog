class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      render 'new', status: :unauthorized
    end
  end

  def destroy
    log_out if logged_in?
    @current_user = nil
    redirect_to home_path
  end
end
