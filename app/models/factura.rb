class Factura < ActiveRecord::Base
  attr_accessible :cantidad, :fecha, :producto_id, :subtotal, :cotizacion_id
  
  def self.search(search)
   where('cantidad like ?', "%#{search}%")
  end

  validates_presence_of :fecha
  validates_presence_of :cantidad
  validates_presence_of :producto_id
  validates_presence_of :subtotal


  has_many :cotizaciones

  belongs_to :pago

  belongs_to :productos

  has_many :tipodocs

  belongs_to :cotizacion

end
