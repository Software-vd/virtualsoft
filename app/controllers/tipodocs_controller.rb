class TipodocsController < ApplicationController
  # GET /tipodocs
  # GET /tipodocs.json
  def index
    @tipodocs = Tipodoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipodocs }
    end
  end

  # GET /tipodocs/1
  # GET /tipodocs/1.json
  def show
    @tipodoc = Tipodoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipodoc }
    end
  end

  # GET /tipodocs/new
  # GET /tipodocs/new.json
  def new
    @tipodoc = Tipodoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipodoc }
    end
  end

  # GET /tipodocs/1/edit
  def edit
    @tipodoc = Tipodoc.find(params[:id])
  end

  # POST /tipodocs
  # POST /tipodocs.json
  def create
    @tipodoc = Tipodoc.new(params[:tipodoc])

    respond_to do |format|
      if @tipodoc.save
        format.html { redirect_to @tipodoc, notice: 'Tipodoc was successfully created.' }
        format.json { render json: @tipodoc, status: :created, location: @tipodoc }
      else
        format.html { render action: "new" }
        format.json { render json: @tipodoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipodocs/1
  # PUT /tipodocs/1.json
  def update
    @tipodoc = Tipodoc.find(params[:id])

    respond_to do |format|
      if @tipodoc.update_attributes(params[:tipodoc])
        format.html { redirect_to @tipodoc, notice: 'Tipodoc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipodoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipodocs/1
  # DELETE /tipodocs/1.json
  def destroy
    @tipodoc = Tipodoc.find(params[:id])
    @tipodoc.destroy

    respond_to do |format|
      format.html { redirect_to tipodocs_url }
      format.json { head :no_content }
    end
  end
end
