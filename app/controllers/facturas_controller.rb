class FacturasController < ApplicationController
 before_filter :require_login

 layout 'fondo'
 
  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @facturas = Factura.search(params[:search]).page(params[:page]).per_page(5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @facturas }
    end
  end

  def show
      @factura = Factura.find(params[:id])
end

  def new
      @factura = Factura.new
  end

  def edit
      @factura = Factura.find(params[:id])
  end

  def create
      @factura = Factura.new(params[:factura])
      render :action => :new unless @factura.save
  end

  def update
      @factura = Factura.find(params[:id])
      render :action => :edit unless @factura.update_attributes(params[:factura])
  end

  def destroy
      @factura= Factura.find(params[:id])
      @factura.destroy
  end
  
end
