class Producto < ActiveRecord::Base
  attr_accessible :tamano_id, :tipo_id, :valor

  validates :tamano_id, :presence => true, 
  :length => { :maximum => 80 }

  validates :tipo_id, :presence => true, 
  :length => { :maximum => 80 }

  validates :valor, :presence => true, 
  :length => { :maximum => 80 }
  
  belongs_to :cotizacion

  has_many :tamanos

  has_many :tipos

  has_many :pedidos

  has_many :facturas
end
