class Valor < ActiveRecord::Base
  attr_accessible :valor_total, :valor_unitario

  belongs_to :cotizacion

  belongs_to :factura

  belongs_to :pago

  belongs_to :producto
end
