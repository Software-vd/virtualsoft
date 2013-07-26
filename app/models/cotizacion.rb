class Cotizacion < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :numero_documento, :tipodoc_id, :ciudad, :direccion, :telefono, :cliente_id
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end

  validates :nombres, :apellidos, :presence => true, 
  :length => { :maximum => 80 }

  validates :numero_documento, :presence => true, 
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true

  validates :tipodoc_id, :presence => true, 
  :length => { :maximum => 80 }

has_many :tipodocs

belongs_to :factura

belongs_to :cliente

has_many :facturas

has_many :cotizaciondetalles

end
