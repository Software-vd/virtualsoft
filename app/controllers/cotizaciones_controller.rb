class CotizacionesController < ApplicationController
 before_filter :require_login

 before_filter :relacion
 
 layout 'fondo'


  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @cotizaciones = @cliente.cotizaciones.search(params[:search]).page(params[:page]).per_page(3)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @cotizaciones }
    end
  end

  def show
      
      if params[:format] == 'pdf' then
      pdf = CotizacionPdf.new(@cotizacion, view_context)
      send_data pdf.render, filename:
      "cotizacion_#{@cotizacion.id}.pdf",
      type: "application/pdf", :disposition => "inline"
    end
  end

  def new
      @cotizacion = Cotizacion.new
  end

  def edit
      
  end

  def create
      @cotizacion = Cotizacion.new(params[:cotizacion])
      @cotizacion.cliente_id = @cliente.id
      render :action => :new unless @cotizacion.save
  end

  def update
      
      render :action => :edit unless @cotizacion.update_attributes(params[:cotizacion])
  end

  def destroy
      
      @cotizacion.destroy
  end

  def relacion
    @cliente = Cliente.find(params[:cliente_id])
    @cotizacion = Cotizacion.find(params[:id]) if params[:id]
  end
  
end