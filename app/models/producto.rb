class Producto < ActiveRecord::Base
  attr_accessible :codigo, :tamano_id, :tipo_id, :valor_id
  
  validates :codigo, :presence => true, 
  :length => { :maximum => 80 }

  validates :tamano_id, :presence => true, 
  :length => { :maximum => 80 }

  validates :tipo_id, :presence => true, 
  :length => { :maximum => 80 }

  validates :valor_id, :presence => true, 
  :length => { :maximum => 80 }
  
  belongs_to :cotizacion

  has_many :tamanos

  has_many :tipos

  has_many :pedidos
end
