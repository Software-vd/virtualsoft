class CotizaciondetallesController < ApplicationController

  before_filter :require_login

  before_filter :relacionar
  
  layout 'fondo'
  
  def index
    @cotizaciondetalles = @cotizacion.cotizaciondetalles.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cotizaciondetalles }
    end
  end

  def show
    if params[:format] == 'pdf' then
      pdf = CotizaciondetallePdf.new(@cliente,@cotizacion,@cotizaciondetalle, view_context)
      send_data pdf.render, filename:
      "cotizaciondetalle_#{@cotizaciondetalle.id}.pdf",
      type: "application/pdf", :disposition => "inline"
    end
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