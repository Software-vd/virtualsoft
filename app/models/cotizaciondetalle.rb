class Cotizaciondetalle < ActiveRecord::Base
  attr_accessible :cantidad, :producto_id, :subtotal

  belongs_to :cotizacion
end
