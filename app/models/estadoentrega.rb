class Estadoentrega < ActiveRecord::Base
	has_many :despachos
  attr_accessible :descripcion
  
  validates :descripcion, :presence => true, 
  :length => { :maximum => 10 }

  belongs_to :despacho

  has_many :pagos
end
