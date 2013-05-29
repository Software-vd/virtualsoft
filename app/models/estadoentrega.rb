class Estadoentrega < ActiveRecord::Base
	has_many :despachos
  attr_accessible :descripcion
end
