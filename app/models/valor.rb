class Valor < ActiveRecord::Base
  attr_accessible :valor_total, :valor_unitario
  
  validates :valor_total, :presence => true,
  :length => { :maximum => 100 }

  validates :valor_unitario, :presence => true,
  :length => { :maximum => 100 }

  belongs_to :cotizacion

  belongs_to :factura

  belongs_to :pago

  belongs_to :producto

  has_many :pedidos
end
