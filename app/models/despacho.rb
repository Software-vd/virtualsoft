class Despacho < ActiveRecord::Base 
	belongs_to :estadoentrega
  attr_accessible :encargado, :fecha, :pagos_id
 
  validates_presence_of :encargado
  validates_presence_of :fecha
  validates_presence_of :pagos_id

  has_many :pagos
end
