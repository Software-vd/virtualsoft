class PagosController < ApplicationController
 before_filter :require_login

 layout 'fondo'
 
  def index
    #para rails 3.2.9 hasta 3.2.12(última versión a abril-2013)
    @pagos = Pago.search(params[:search]).page(params[:page]).per_page(3)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @pagos }
    end
  end

  def show
      @pago = Pago.find(params[:id])
  end

  def new
      @pago = Pago.new
  end

  def edit
      @pago = Pago.find(params[:id])
  end

  def create
      @pago= Pago.new(params[:pago])
      render :action => :new unless @pago.save
  end

  def update
      @pago = Pago.find(params[:id])
      render :action => :edit unless @pago.update_attributes(params[:pago])
  end

  def destroy
      @pago= Pago.find(params[:id])
      @pago.destroy
  end
  
end