class Cotizacion < ActiveRecord::Base
 attr_accessible :fecha, :ciudad, :cliente_id
 
 def self.search(search)
  where('ciudad like ?', "%#{search}%")
 end

has_many :tipodocs

belongs_to :factura

belongs_to :cliente

has_many :facturas

has_many :cotizaciondetalles

end