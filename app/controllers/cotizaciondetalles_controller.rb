class CotizaciondetallesController < ApplicationController

  before_filter :require_login

  before_filter :relacionar
  
  layout 'fondo'
  
  def index
    @cotizaciondetalles = @cotizacion.cotizaciondetalles.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cotizaciondetalles }
      format.pdf { output = DetallePdf.new(@cliente, @cotizacion, @cotizaciondetalles, view_context)
       send_data output.render, :filename => "detalles.pdf", :type => "application/pdf", 
                                :disposition => "inline" }
    end
  end

  def show
  end

  def new
      @cotizaciondetalle = Cotizaciondetalle.new
  end

  def edit
     
  end

  def create
      @cotizaciondetalle = Cotizaciondetalle.new(params[:cotizaciondetalle])
      @cotizaciondetalle.cotizacion_id = @cotizacion.id
      render :action => :new unless @cotizaciondetalle.save
  end

  def update
      
      render :action => :edit unless @cotizaciondetalle.update_attributes(params[:cotizaciondetalle])
  end

  def destroy
      
      @cotizaciondetalle.destroy
  end
  
  def relacionar
     @cotizacion = Cotizacion.find(params[:cotizacion_id])
     @cotizaciondetalle = Cotizaciondetalle.find(params[:id]) if params[:id]
  end
end

class DetallePdf < Prawn::Document

  def initialize(cliente,cotizacion,cotizaciondetalle,view)
    super()
    @cotizaciondetalle = cotizaciondetalle
    @cotizacion = cotizacion
    @cliente = cliente
    @view = view
    logo
    titulo
    deliver_details
    @cotizaciondetalle_details
    cotizacion_details
    @total = @cotizaciondetalle.sum(&:subtotal)
    total
  end

  def cotizacion_details
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
   [["Producto", "Cantidad", "Subtotal"]] +
   @cotizaciondetalle.map do |c| 
   [ "#{c.producto_id}", "#{c.cantidad}", "#{c.subtotal}" ]
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
    #{@cotizacion.cliente.apellidos}
    #{@cotizacion.cliente.direccion}
    #{@cotizacion.cliente.telefono}", :size => 13
  end

  def deliver_details
    move_down 60
    ciudad = @cotizacion.ciudad
    fecha = @cotizacion.fecha
    tipodoc = @cotizacion.cliente.tipodoc_id
    numero_documento = @cotizacion.cliente.numero_documento
    nombres = @cotizacion.cliente.nombres
    apellidos = @cotizacion.cliente.apellidos
    direccion = @cotizacion.cliente.direccion
    telefono = @cotizacion.cliente.telefono
    table ([["Ciudad","Fecha"],
            ["#{ciudad}","#{fecha}"]]),
            :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 100, 2 => 50}
            columns(3).font_style = :bold
            end 

    table ([["Tipodoc","N. documento","Nombres","Apellidos","Direccion","Telefono"],
            ["#{tipodoc}","#{numero_documento}","#{nombres}","#{apellidos}","#{direccion}","#{telefono}"]]),
            :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 60, 2 => 60}
            columns(3).font_style = :bold
            end       
  end


end