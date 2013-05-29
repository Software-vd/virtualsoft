class Cotizacion < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :numero_cotizacion, :numero_documento, :tipodoc_id, :producto_id, :valor_id
  
  def self.search(search)
   where('nombres like ?', "%#{search}%")
  end
end
