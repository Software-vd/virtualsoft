class Despacho < ActiveRecord::Base 
	belongs_to :estadoentrega
  attr_accessible :encargado, :fecha, :pagos_id
  
  validates :encargado, :presence => true,
  :length => { :maximum => 90 }

  validates :pagos_id, :presence => true,
  :length => { :maximum => 100 }

  has_many :pagos
end
