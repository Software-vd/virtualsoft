class Tipodoc < ActiveRecord::Base
  attr_accessible :descripcion
  
  validates :descripcion, :presence => true,
  :length => { :maximum => 100 }

  belongs_to :cliente

  belongs_to :cotizacion
end
