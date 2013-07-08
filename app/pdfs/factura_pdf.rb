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
    #{factura.tipodoc_id}
    #{factura.numero_documento}
    #{factura.nombres}
    #{factura.apellidos}
    #{factura.cantidad}
    #{factura.cotizacion_id}
    #{factura.valor} ", :size => 13
 end

       def deliver_details
               move_down 60
               fecha = @factura.fecha
               tipodoc = @factura.tipodoc_id
               numero_documento = @factura.numero_documento
               nombres = @factura.nombres
               apellido = @factura.apellido
               cantidad = @factura.cantidad
               cotizacion = @factura.cotizacion_id
               valor = @factura.valor
               table ([["Fecha","#{fecha}"],
                       ["Tipodoc","#{tipodoc}"],
                       ["Numero_documento","#{numero_documento}"],
                       ["Nombres","#{nombres}"],
                       ["Apellido","#{apellidos}"],
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