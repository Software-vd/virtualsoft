class CotizaciondetallesController < ApplicationController
  # GET /cotizaciondetalles
  # GET /cotizaciondetalles.json
  def index
    @cotizaciondetalles = Cotizaciondetalle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cotizaciondetalles }
    end
  end

  # GET /cotizaciondetalles/1
  # GET /cotizaciondetalles/1.json
  def show
    @cotizaciondetalle = Cotizaciondetalle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cotizaciondetalle }
    end
  end

  # GET /cotizaciondetalles/new
  # GET /cotizaciondetalles/new.json
  def new
    @cotizaciondetalle = Cotizaciondetalle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cotizaciondetalle }
    end
  end

  # GET /cotizaciondetalles/1/edit
  def edit
    @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
  end

  # POST /cotizaciondetalles
  # POST /cotizaciondetalles.json
  def create
    @cotizaciondetalle = Cotizaciondetalle.new(params[:cotizaciondetalle])

    respond_to do |format|
      if @cotizaciondetalle.save
        format.html { redirect_to @cotizaciondetalle, notice: 'Cotizaciondetalle was successfully created.' }
        format.json { render json: @cotizaciondetalle, status: :created, location: @cotizaciondetalle }
      else
        format.html { render action: "new" }
        format.json { render json: @cotizaciondetalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cotizaciondetalles/1
  # PUT /cotizaciondetalles/1.json
  def update
    @cotizaciondetalle = Cotizaciondetalle.find(params[:id])

    respond_to do |format|
      if @cotizaciondetalle.update_attributes(params[:cotizaciondetalle])
        format.html { redirect_to @cotizaciondetalle, notice: 'Cotizaciondetalle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cotizaciondetalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cotizaciondetalles/1
  # DELETE /cotizaciondetalles/1.json
  def destroy
    @cotizaciondetalle = Cotizaciondetalle.find(params[:id])
    @cotizaciondetalle.destroy

    respond_to do |format|
      format.html { redirect_to cotizaciondetalles_url }
      format.json { head :no_content }
    end
  end
end
