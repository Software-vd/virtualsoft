class FacturaPdf < Prawn::Document

 def initialize(factura,view)
       super()
       @factura = factura
       @view = view
       logo
       deliver_details
       @factura_details
 end

 def logo
       logopath ="#{Rails.root}/app/assets/images/pdf.png"
       image logopath, :width => 50,:heigth => 20
       move_down 10
       draw_text "PDF",:at => [150,650],size:30
 end


 def deliver_details
   move_down 60
   text "Factura:
    #{factura.fecha}
    #{factura.nombres}
    #{factura.apellido}
    #{factura.cantidad}
    #{factura.cotizacion_id}
    #{factura.valor_id} ", :size => 13
 end

       def deliver_details
               move_down 60
               fecha = @factura.fecha
               nombres = @factura.nombres
               apellido = @factura.apellido
               cantidad = @factura.cantidad
               cotizacion = @factura.cotizacion_id
               valor = @factura.valor_id
               table ([["Fecha","#{fecha}"],
                       ["Nombres","#{nombres}"],
                       ["Apellido","#{apellido}"],
                       ["Cantidad","#{cantidad}"],
                       ["Cotizacion","#{cotizacion}"],
                       ["Valor","#{valor}"],
               ]),
               :width => 500 do
                       columns(1).align = :center
                       self.header = true
                       self.column_widths = {0 => 100, 2 => 50}
                       columns(3).font_style = :bold
               end        
       end
end