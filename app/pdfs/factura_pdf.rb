class FacturaPdf < Prawn::Document

 def initialize(factura,view)
       super()
       @factura = factura
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
    #{factura.tipodoc_id}
    #{factura.numero_documento}
    #{factura.nombres}
    #{factura.apellidos}
    #{factura.cantidad}
    #{factura.producto_id}
    #{factura.valor} ", :size => 13
 end

  def deliver_details
   move_down 60
   fecha = @factura.fecha
   tipodoc = @factura.tipodoc_id
   numero_documento = @factura.numero_documento
   nombres = @factura.nombres
   apellidos = @factura.apellidos
   cantidad = @factura.cantidad
   producto = @factura.producto_id
   valor = @factura.valor
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
               valor = @factura.valor
               table ([["Cantidad","Producto","Valor"],
                       ["#{cantidad}","#{producto}","#{valor}"]]),
               :width => 500 do
                       columns(1).align = :center
                       self.header = true
                       self.column_widths = {0 => 100, 2 => 50}
                       columns(3).font_style = :bold
               end        
       end
end