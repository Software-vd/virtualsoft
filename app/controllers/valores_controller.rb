class ValoresController < ApplicationController
  # GET /valores
  # GET /valores.json
  def index
    @valores = Valor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @valores }
    end
  end

  # GET /valores/1
  # GET /valores/1.json
  def show
    @valor = Valor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @valor }
    end
  end

  # GET /valores/new
  # GET /valores/new.json
  def new
    @valor = Valor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valor }
    end
  end

  # GET /valores/1/edit
  def edit
    @valor = Valor.find(params[:id])
  end

  # POST /valores
  # POST /valores.json
  def create
    @valor = Valor.new(params[:valor])

    respond_to do |format|
      if @valor.save
        format.html { redirect_to @valor, notice: 'Valor was successfully created.' }
        format.json { render json: @valor, status: :created, location: @valor }
      else
        format.html { render action: "new" }
        format.json { render json: @valor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /valores/1
  # PUT /valores/1.json
  def update
    @valor = Valor.find(params[:id])

    respond_to do |format|
      if @valor.update_attributes(params[:valor])
        format.html { redirect_to @valor, notice: 'Valor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @valor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valores/1
  # DELETE /valores/1.json
  def destroy
    @valor = Valor.find(params[:id])
    @valor.destroy

    respond_to do |format|
      format.html { redirect_to valores_url }
      format.json { head :no_content }
    end
  end
end
