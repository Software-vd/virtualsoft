class EstadoentregasController < ApplicationController
 before_filter :require_login
 
 layout 'fondo'
 
  def index
    @estadoentregas = Estadoentrega.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estadoentregas }
    end
  end

  def show
      @estadoentrega = Estadoentrega.find(params[:id])
  end

  def new
      @estadoentrega = Estadoentrega.new
  end

  def edit
      @estadoentrega = Estadoentrega.find(params[:id])
  end

  def create
      @estadoentrega = Estadoentrega.new(params[:estadoentrega])
      render :action => :new unless @estadoentrega.save
  end

  def update
      @estadoentrega = Estadoentrega.find(params[:id])
      render :action => :edit unless @estadoentrega.update_attributes(params[:estadoentrega])
  end

  def destroy
      @estadoentrega= Estadoentrega.find(params[:id])
      @estadoentrega.destroy
  end
  
end
