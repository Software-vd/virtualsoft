class Despacho < ActiveRecord::Base 
	belongs_to :estadoentrega
  attr_accessible :encargado, :fecha, :estado_entrega_id, :pagos_id

  has_many :pagos
end
