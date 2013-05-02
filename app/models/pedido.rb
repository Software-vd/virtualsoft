class Pedido < ActiveRecord::Base
  attr_accessible :Cantidad, :Fecha, :Numero_pedido, :cliente_id, :producto_id, :valor_id
end
