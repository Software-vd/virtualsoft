class DespachosController < ApplicationController

  def index
    @despachos = Despacho.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @despachos }
    end
  end

  def show
      @despacho = Despacho.find(params[:id])
  end

  def new
      @despacho = Despacho.new
  end

  def edit
      @despacho = Despacho.find(params[:id])
  end

  def create
      @despacho = Despacho.new(params[:despacho])
      render :action => :new unless @despacho.save
  end

  def update
      @despacho = Despacho.find(params[:id])
      render :action => :edit unless @despacho.update_attributes(params[:despacho])
  end

  def destroy
      @despacho = Despacho.find(params[:id])
      @despacho.destroy
  end
  
end