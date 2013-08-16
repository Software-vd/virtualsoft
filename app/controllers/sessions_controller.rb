class SessionsController < ApplicationController
  layout 'login'
  def new
  end

  def create
  	user = login(params[:username], params[:password], params[:remember_me])
  	if user
  		redirect_back_or_to home_path
  	else
  		flash.now.alert = "Email or password was invalid"
  	end
  end

  def destroy
  	logout
  	redirect_to login_path
  end
end
