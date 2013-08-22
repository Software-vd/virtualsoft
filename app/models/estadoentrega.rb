class Estadoentrega < ActiveRecord::Base
	has_many :despachos
  attr_accessible :descripcion

  validates_presence_of :descripcion

  belongs_to :despacho

  has_many :pagos
end
