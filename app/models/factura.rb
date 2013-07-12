class Factura < ActiveRecord::Base
  attr_accessible :apellidos, :cantidad, :fecha, :nombres, :producto_id, :valor, :tipodoc_id, :numero_documento
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end
  
  validates :nombres, :apellidos, :presence => true,
  :length => { :maximum => 80 }
  
  validates :cantidad, :presence => true,
  :length => { :maximum => 3 }

  validates :producto_id, :presence => true,
  :length => { :maximum => 1 }

  validates :valor, :presence => true,
  :length => { :maximum => 10 }

  has_many :cotizaciones

  belongs_to :pago

  belongs_to :productos

  has_many :tipodocs
end
