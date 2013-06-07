class Pedido < ActiveRecord::Base
  attr_accessible :cantidad, :fecha, :numero_pedido, :cliente_id, :producto_id, :valor_id
  
  def self.search(search)
    where('cantidad like ?', "%#{search}%")
  end

  belongs_to :cliente

  belongs_to :producto

  belongs_to :valor
  
end
