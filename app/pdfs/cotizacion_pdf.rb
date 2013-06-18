class CotizacionPdf < Prawn::Document

 def initialize(cotizacion,view)
       super()
       @cotizacion = cotizacion
       @view = view
       logo
       deliver_details
       @cotizacion_details
 end

 def logo
       logopath ="#{Rails.root}/app/assets/images/pdf.png"
       image logopath, :width => 50,:heigth => 20
       move_down 10
       draw_text "PDF",:at => [150,650],size:30
 end


 def deliver_details
   move_down 60
   text "Cotizacion:
  #{@cotizacion.fecha}
  #{@cotizacion.tipodoc_id}
  #{@cotizacion.nombres}
  #{@cotizacion.apellidos}
  #{@cotizacion.producto_id}
  #{@cotizacion.valor} ", :size => 13
 end

       def deliver_details
               move_down 60
               fecha = @cotizacion.fecha
               tipodoc = @cotizacion.tipodoc_id
               nombres = @cotizacion.nombres
               apellidos = @cotizacion.apellidos
               producto = @cotizacion.producto_id
               valor = @cotizacion.valor
               table ([["Fecha","#{fecha}"],
                       ["Tipodoc","#{tipodoc}"],
                       ["Nombres","#{nombres}"],
                       ["Apellidos","#{apellidos}"],
                       ["Producto","#{producto}"],
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