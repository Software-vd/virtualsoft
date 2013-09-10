class TipodocsController < ApplicationController
  before_filter :require_login
  def index
    @tipodocs = Tipodoc.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipodocs }
    end
  end

  def show
      @tipodoc = Tipodoc.find(params[:id])
  end

  def new
      @tipodoc = Tipodoc.new
  end

  def edit
      @tipodoc = Tipodoc.find(params[:id])
  end

  def create
      @tipodoc = Tipodoc.new(params[:tipodoc])
      render :action => :new unless @tipodoc.save
  end

  def update
      @tipodoc = Tipodoc.find(params[:id])
      render :action => :edit unless @tipodoc.update_attributes(params[:tipodoc])
  end

  def destroy
      @tipodoc = Tipodoc.find(params[:id])
      @tipodoc.destroy
  end
  
end