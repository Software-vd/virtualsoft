class CotizacionesController < ApplicationController

  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @cotizaciones = Cotizacion.search(params[:search]).page(params[:page]).per_page(5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @cotizaciones }
    end
  end


  def show
      @cotizacion = Cotizacion.find(params[:id])
  end

  def new
      @cotizacion = Cotizacion.new
  end

  def edit
      @cotizacion = Cotizacion.find(params[:id])
  end

  def create
      @cotizacion= Cotizacion.new(params[:cotizacion])
      render :action => :new unless @cotizacion.save
  end

  def update
      @cotizacion = Cotizacion.find(params[:id])
      render :action => :edit unless @cotizacion.update_attributes(params[:cotizacion])
  end

  def destroy
      @cotizacion= Cotizacion.find(params[:id])
      @cotizacion.destroy
  end
  
end