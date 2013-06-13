class Factura < ActiveRecord::Base
  attr_accessible :apellido, :cantidad, :fecha, :nombres, :productos, :cotizacion_id, :valor_id
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end
  
  validates :nombres, :apellido, :presence => true,
  :length => { :maximum => 80 }
  
  validates :cantidad, :presence => true,
  :length => { :maximum => 3 }

  validates :productos, :presence => true,
  :length => { :maximum => 80 }

  validates :cotizacion_id, :presence => true,
  :length => { :maximum => 10 }

  validates :valor_id, :presence => true,
  :length => { :maximum => 10 }

  has_many :cotizaciones

  belongs_to :pago
end
