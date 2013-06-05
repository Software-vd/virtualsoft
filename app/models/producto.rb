class Producto < ActiveRecord::Base
  attr_accessible :codigo, :tamano_id, :tipo_id, :valor_id

  belongs_to :cotizacion

  has_many :tamanos

  has_many :tipos
end
