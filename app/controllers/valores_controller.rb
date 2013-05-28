class ValoresController < ApplicationController
  before_filter :require_login
  def index
    @valores = Valor.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @valores }
    end
  end

  def show
      @valor = Valor.find(params[:id])
  end

  def new
      @valor = Valor.new
  end

  def edit
      @valor = Valor.find(params[:id])
  end

  def create
      @valor = Valor.new(params[:valor])
      render :action => :new unless @valor.save
  end

  def update
      @valor = Valor.find(params[:id])
      render :action => :edit unless @valor.update_attributes(params[:valor])
  end

  def destroy
      @valor = Valor.find(params[:id])
      @valor.destroy
  end
  
end