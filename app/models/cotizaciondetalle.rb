class Cotizaciondetalle < ActiveRecord::Base
  attr_accessible :cantidad, :producto_id, :subtotal

  validates_presence_of :cantidad
  validates_presence_of :subtotal
  validates_presence_of :producto_id

  belongs_to :cotizacion
end
