class ProductosController < ApplicationController
before_filter :require_login

layout 'fondo'

  def index
    @productos = Producto.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  def show
      @producto = Producto.find(params[:id])
  end

  def new
      @producto = Producto.new
  end

  def edit
      @producto = Producto.find(params[:id])
  end

  def create
      @producto = Producto.new(params[:producto])
      render :action => :new unless @producto.save
  end

  def update
      @producto = Producto.find(params[:id])
      render :action => :edit unless @producto.update_attributes(params[:producto])
  end

  def destroy
      @producto = Producto.find(params[:id])
      @producto.destroy
  end
  
end
