class TamanosController < ApplicationController
  before_filter :require_login
  def index
    @tamanos = Tamano.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tamanos }
    end
  end

  def show
      @tamano = Tamano.find(params[:id])
  end

  def new
      @tamano = Tamano.new
  end

  def edit
      @tamano = Tamano.find(params[:id])
  end

  def create
      @tamano = Tamano.new(params[:tamano])
      render :action => :new unless @tamano.save
  end

  def update
      @tamano = Tamano.find(params[:id])
      render :action => :edit unless @tamano.update_attributes(params[:tamano])
  end

  def destroy
      @tamano = Tamano.find(params[:id])
      @tamano.destroy
  end
  
end