class SessionsController < ApplicationController
  layout 'login'
  def new
  end

  def create
  	user = login(params[:username], params[:password], params[:remember_me])
  	if user
  		redirect_back_or_to home_path  #para saber donde nos va llevar la pagina despues de loguearnos
  	else
  		flash.now.alert = "Email or password was invalid"
      redirect_to users_path  #se va para users cuando no esta registrado en el sistema
  	end
  end

  def destroy
  	logout
  	redirect_to login_path   #para devolverse al inicio de sesion despues de salir de la aplicacion
  end
end
