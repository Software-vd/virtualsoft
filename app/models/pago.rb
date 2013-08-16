class Pago < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :estado_entrega_id, :valor
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end
  
  validates :nombres, :apellidos, :presence => true, 
  :length => { :maximum => 80 }

  validates :valor, :presence => true, 
  :length => { :maximum => 80 }

  belongs_to :despacho

  has_many :facturas

  belongs_to :estado_entrega

end
