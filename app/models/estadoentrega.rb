class Estadoentrega < ActiveRecord::Base
	has_many :despachos
  attr_accessible :descripcion

  belongs_to :despacho
end
