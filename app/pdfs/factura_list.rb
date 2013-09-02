class FacturaList < Prawn::Document

  def initialize(cliente,cotizacion,facturas,view)
    super()
    @factura = facturas
    @cotizacion = cotizacion
    @cliente = cliente
    @view = view
    logo
    titulo
    registro
    deliver_details
    detalle
    @factura_details
  end

 def logo
    logopath ="#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 50,:heigth => 20
    move_down 10
  end

  
  def registro
   move_down 20
   @factura.map do |c| 
   text "#{c.producto_id}    #{c.cantidad}    #{c.subtotal}"
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
  def detalle
    move_down 60
    cantidad = @factura.cantidad
    producto = @factura.producto_id
    subtotal = @factura.subtotal

  table ([["Cantidad","Producto","Subtotal"],
            ["#{cantidad}","#{producto}","#{subtotal}"]]),
            :width => 500 do
            columns(1).align = :center
            self.header = true
            self.column_widths = {0 => 100, 2 => 60}
            columns(3).font_style = :bold
            end      
  end
end
