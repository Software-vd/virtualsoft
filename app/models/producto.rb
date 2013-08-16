class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :valor, :tipo_id, :tamano_id

  validates :valor, :presence => true, 
  :length => { :maximum => 80 }
  
  belongs_to :cotizacion

  has_many :pedidos

  has_many :facturas
  
end
