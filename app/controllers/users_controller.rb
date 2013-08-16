class UsersController < ApplicationController
  layout 'registro'
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Registro Satisfactorio!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
