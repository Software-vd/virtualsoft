class Cotizacion < ActiveRecord::Base
  attr_accessible :apellidos, :fecha, :nombres, :numero_documento, :tipodoc_id, :producto_id, :valor_id
  
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

validates :producto_id, :presence => true, 
:length => { :maximum => 80 }

validates :valor_id, :presence => true, 
:length => { :maximum => 80 }

has_many :tipodocs

has_many :productos

has_many :valores

belongs_to :factura
end
