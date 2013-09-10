class TiposController < ApplicationController
  before_filter :require_login
  def index
    @tipos = Tipo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos }
    end
  end

  def show
      @tipo = Tipo.find(params[:id])
  end

  def new
      @tipo = Tipo.new
  end

  def edit
      @tipo = Tipo.find(params[:id])
  end

  def create
      @tipo = Tipo.new(params[:tipo])
      render :action => :new unless @tipo.save
  end

  def update
      @tipo = Tipo.find(params[:id])
      render :action => :edit unless @tipo.update_attributes(params[:tipo])
  end

  def destroy
      @tipo = Tipo.find(params[:id])
      @tipo.destroy
  end
  
end