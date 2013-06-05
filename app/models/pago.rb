class Pago < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :factura_id, :valor_id
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end

  belongs_to :despacho

  has_many :facturas

  has_many :valores
end
