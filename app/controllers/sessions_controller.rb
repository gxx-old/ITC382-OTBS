# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  def new
  end

  def create
    self.current_user = User.authenticate(params[:session][:login], params[:session][:password])
    if logged_in?
      if params[:session_remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = "Logged in successfully"
      redirect_back_or_default('/')
    else
      flash.now[:notice] = "Incorrect user name or password."
      render :action => :new
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
