class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :valor, :tipo_id, :tamano_id

  validates_presence_of :descripcion
  validates_presence_of :valor
  validates_presence_of :tipo_id
  validates_presence_of :tamano_id
  
  belongs_to :cotizacion

  has_many :pedidos

  has_many :facturas
  
end
