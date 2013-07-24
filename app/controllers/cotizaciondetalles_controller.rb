class CotizaciondetallesController < ApplicationController

  before_filter :require_login
  
  layout 'fondo'
  
  def index
    @cotizaciondetalles = Cotizaciondetalle.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cotizaciondetalles }
    end
  end

  def show
      @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
  end

  def new
      @cotizaciondetalle = Cotizaciondetalle.new
  end

  def edit
      @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
  end

  def create
      @cotizaciondetalle = Cotizaciondetalle.new(params[:cotizaciondetalle])
      render :action => :new unless @cotizaciondetalle.save
  end

  def update
      @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
      render :action => :edit unless @cotizaciondetalle.update_attributes(params[:cotizaciondetalle])
  end

  def destroy
      @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
      @cotizaciondetalle.destroy
  end
  
end