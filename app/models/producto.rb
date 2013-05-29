class Producto < ActiveRecord::Base
  attr_accessible :codigo, :tamano_id, :tipo_id, :valor_id
end
