class FacturasController < ApplicationController
 before_filter :require_login

 before_filter :rel

 layout 'fondo'
 
  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @facturas = @cotizacion.facturas.search(params[:search]).page(params[:page]).per_page(3)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @facturas }
    end
  end

  def show

      if params[:format] == 'pdf' then
      pdf = FacturaPdf.new(@factura, view_context)
      send_data pdf.render, filename:
      "factura_#{@factura.id}.pdf",
      type: "application/pdf", :disposition => "inline"
    end
end

  def new
      @factura = Factura.new
  end

  def edit
      
  end

  def create
      @factura = Factura.new(params[:factura])
      @factura.cotizacion_id = @cotizacion.id
      render :action => :new unless @factura.save
  end

  def update
     
      render :action => :edit unless @factura.update_attributes(params[:factura])
  end

  def destroy
      
      @factura.destroy
  end
  
  def rel
    @cotizacion = Cotizacion.find(params[:cotizacion_id])
    @factura = Factura.find(params[:id]) if params[:id]
  end
end
