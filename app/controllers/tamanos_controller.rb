class TamanosController < ApplicationController
  # GET /tamanos
  # GET /tamanos.json
  def index
    @tamanos = Tamano.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tamanos }
    end
  end

  # GET /tamanos/1
  # GET /tamanos/1.json
  def show
    @tamano = Tamano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tamano }
    end
  end

  # GET /tamanos/new
  # GET /tamanos/new.json
  def new
    @tamano = Tamano.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tamano }
    end
  end

  # GET /tamanos/1/edit
  def edit
    @tamano = Tamano.find(params[:id])
  end

  # POST /tamanos
  # POST /tamanos.json
  def create
    @tamano = Tamano.new(params[:tamano])

    respond_to do |format|
      if @tamano.save
        format.html { redirect_to @tamano, notice: 'Tamano was successfully created.' }
        format.json { render json: @tamano, status: :created, location: @tamano }
      else
        format.html { render action: "new" }
        format.json { render json: @tamano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tamanos/1
  # PUT /tamanos/1.json
  def update
    @tamano = Tamano.find(params[:id])

    respond_to do |format|
      if @tamano.update_attributes(params[:tamano])
        format.html { redirect_to @tamano, notice: 'Tamano was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tamano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tamanos/1
  # DELETE /tamanos/1.json
  def destroy
    @tamano = Tamano.find(params[:id])
    @tamano.destroy

    respond_to do |format|
      format.html { redirect_to tamanos_url }
      format.json { head :no_content }
    end
  end
end
