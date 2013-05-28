class ClientesController < ApplicationController
  before_filter :require_login
  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @clientes = Cliente.search(params[:search]).page(params[:page]).per_page(2)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @clientes }
    end
  end

  def show
      @cliente = Cliente.find(params[:id])
  end

  def new
      @cliente = Cliente.new
  end

  def edit
      @cliente = Cliente.find(params[:id])
  end

  def create
      @cliente = Cliente.new(params[:cliente])
      render :action => :new unless @cliente.save
  end

  def update
      @cliente = Cliente.find(params[:id])
      render :action => :edit unless @cliente.update_attributes(params[:cliente])
  end

  def destroy
      @cliente = Cliente.find(params[:id])
      @cliente.destroy
  end
  
end