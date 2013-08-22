class FacturaPdf < Prawn::Document

 def initialize(cliente,cotizacion,factura,view)
       super()
       @factura = factura
       @cotizacion = cotizacion
       @cliente = cliente
       @view = view
       logo
       titulo
       deliver_details
       tabla
       @factura_details
 end

 def logo
       logopath ="#{Rails.root}/app/assets/images/logo.png"
       image logopath, :width => 50,:heigth => 20
       move_down 10
 end

def titulo
   draw_text "ASERRIO LA ARBOLEDA",:at => [100,650],size:30
   draw_text "Calle 45A(padilla) No.55-86 Tels. 513 07 81 - 231 92 68",:at => [90,632],size:15
   draw_text "Medellin-Colombia",:at => [210,616],size:15
 end


 def deliver_details
   move_down 60
   text "Factura:
    #{factura.fecha}
    #{@cotizacion.cliente.tipodoc_id}
    #{@cotizacion.cliente.numero_documento}
    #{@cotizacion.cliente.nombres}
    #{@cotizacion.cliente.apellidos}
    #{factura.cantidad}
    #{@cotizaciondetalle.producto_id}
    #{factura.subtotal} ", :size => 13
 end

  def deliver_details
   move_down 60
   fecha = @factura.fecha
   tipodoc = @cotizacion.cliente.tipodoc_id
   numero_documento = @cotizacion.cliente.numero_documento
   nombres = @cotizacion.cliente.nombres
   apellidos = @cotizacion.cliente.apellidos
   table ([["Fecha","Tipodoc","Numero_documento","Nombres","Apellidos"],
           ["#{fecha}","#{tipodoc}","#{numero_documento}","#{nombres}","#{apellidos}"]]),
           :width => 500 do
           columns(1).align = :center
           self.header = true
           self.column_widths = {0 => 100, 2 => 120}
           columns(3).font_style = :bold
           end    
 end

       def tabla
               move_down 60
               fecha = @factura.fecha
               tipodoc = @factura.tipodoc_id
               numero_documento = @factura.numero_documento
               nombres = @factura.nombres
               apellidos = @factura.apellidos
               cantidad = @factura.cantidad
               producto = @factura.producto_id
               subtotal = @factura.subtotal
               table ([["Cantidad","Producto","Subtotal"],
                       ["#{cantidad}","#{producto}","#{subtotal}"]]),
               :width => 500 do
                       columns(1).align = :center
                       self.header = true
                       self.column_widths = {0 => 100, 2 => 70}
                       columns(3).font_style = :bold
               end        
       end
end