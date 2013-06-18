class Pedido < ActiveRecord::Base
  attr_accessible :cantidad, :fecha, :numero_pedido, :cliente_id, :producto_id, :valor
  
  def self.search(search)
    where('cantidad like ?', "%#{search}%")
  end
  
  validates :cantidad, :presence => true,
  :length => { :maximum => 3 }

  validates :cliente_id, :presence => true,
  :length => { :maximum => 80 }

  validates :producto_id, :presence => true,
  :length => { :maximum => 80 }

  validates :valor, :presence => true,
  :length => { :maximum => 20 }

  belongs_to :cliente

  belongs_to :producto
  
end
