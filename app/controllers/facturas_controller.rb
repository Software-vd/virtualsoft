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
      format.pdf { output = FacturaList.new(@cliente, @cotizacion, @facturas, view_context)
       send_data output.render, :filename => "facturas.pdf", :type => "application/pdf", 
                                :disposition => "inline" }
    end
  end

  def show
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

class FacturaList < Prawn::Document

  def initialize(cliente,cotizacion,facturas,view)
    super()
    @factura = facturas
    @cotizacion = cotizacion
    @cliente = cliente
    @view = view
    logo
    titulo
    deliver_details
    registro
    factura_details
    @total = @factura.sum(&:subtotal)
    total
  end
 
 def factura_details
  move_down 50
  table registro, :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 100, 2 => 60}
            columns(3).font_style = :bold
            end  
  end

 def logo
    logopath ="#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 50,:heigth => 20
    move_down 10
  end

  def total
   move_down 40
   text "Total  #{@total}"
  end
  
  def registro
   move_down 20
   [["Cantidad", "Producto", "Subtotal"]] +
   @factura.map do |f| 
   [ "#{f.cantidad}", "#{f.producto_id}", "#{f.subtotal}" ]
   end
  end

 def titulo
    draw_text "ASERRIO LA ARBOLEDA",:at => [100,650],size:30
    draw_text "Calle 45A(padilla) No.55-86 Tels. 513 07 81 - 231 92 68",:at => [90,632],size:15
    draw_text "Medellin-Colombia",:at => [210,616],size:15
  end

def deliver_details
    move_down 60
    text "Cotizaciondetalle:
    #{@cotizacion.ciudad}
    #{@cotizacion.fecha}
    #{@cotizacion.cliente.tipodoc_id}
    #{@cotizacion.cliente.numero_documento}
    #{@cotizacion.cliente.nombres}
    #{@cotizacion.cliente.apellidos}", :size => 13
  end

  def deliver_details
    move_down 60
    ciudad = @cotizacion.ciudad
    fecha = @cotizacion.fecha
    tipodoc = @cotizacion.cliente.tipodoc_id
    numero_documento = @cotizacion.cliente.numero_documento
    nombres = @cotizacion.cliente.nombres
    apellidos = @cotizacion.cliente.apellidos
    table ([["Ciudad","Fecha"],
            ["#{ciudad}","#{fecha}"]]),
            :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 100, 2 => 50}
            columns(3).font_style = :bold
            end 

    table ([["Tipodoc","N. documento","Nombres","Apellidos"],
            ["#{tipodoc}","#{numero_documento}","#{nombres}","#{apellidos}"]]),
            :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 60, 2 => 60}
            columns(3).font_style = :bold
            end       
  end
end