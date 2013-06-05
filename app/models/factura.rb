class Factura < ActiveRecord::Base
  attr_accessible :apellido, :cantidad, :fecha, :nombres, :numero_factura, :productos, :cotizacion_id, :valor_id
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end

  has_many :cotizaciones

  belongs_to :pago
end
