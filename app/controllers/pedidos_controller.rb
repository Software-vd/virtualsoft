class PedidosController < ApplicationController
  before_filter :require_login
  before_filter :relacion
  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @pedidos = @cliente.pedidos.search(params[:search]).page(params[:page]).per_page(2)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pedidos }
    end
  end


  def show
      
  end

  def new
      @pedido = Pedido.new
  end

  def edit
      
  end

  def create
      @pedido = Pedido.new(params[:pedido])
      @pedido.cliente_id = @cliente.id
      render :action => :new unless @pedido.save
  end

  def update
      
      render :action => :edit unless @cliente.update_attributes(params[:pedido])
  end

  def destroy
      
      @pedido.destroy
  end
  
  private

  def relacion
    @cliente = Cliente.find(params[:cliente_id])
    @pedido = Pedido.find(params[:id]) if params[:id]
  end
  
end