class Tipodoc < ActiveRecord::Base
  attr_accessible :descripcion

  validates_presence_of :descripcion

  belongs_to :cliente

  belongs_to :cotizacion

  belongs_to :factura
end
