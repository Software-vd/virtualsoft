class CotizacionPdf < Prawn::Document

  def initialize(cotizacion,view)
    super()
    @cotizacion = cotizacion
    @view = view
    logo
    titulo
    deliver_details
    @cotizacion_details
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
    text "Cotizacion:
    #{@cotizacion.ciudad}
    #{@cotizacion.fecha}
    #{@cotizacion.tipodoc_id}
    #{@cotizacion.numero_documento}
    #{@cotizacion.nombres}
    #{@cotizacion.apellidos}
    #{@cotizacion.direccion}
    #{@cotizacion.telefono}", :size => 13
  end

  def deliver_details
    move_down 60
    ciudad = @cotizacion.ciudad
    fecha = @cotizacion.fecha
    tipodoc = @cotizacion.tipodoc_id
    numero_documento = @cotizacion.numero_documento
    nombres = @cotizacion.nombres
    apellidos = @cotizacion.apellidos
    direccion = @cotizacion.direccion
    telefono = @cotizacion.telefono
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
