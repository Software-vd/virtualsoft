class Pago < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :estado_entrega_id, :valor
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end
  
  validates_presence_of :nombres
  validates_presence_of :apellidos
  validates_presence_of :valor
  validates_presence_of :estado_entrega_id

  belongs_to :despacho

  has_many :facturas

  belongs_to :estado_entrega

end
