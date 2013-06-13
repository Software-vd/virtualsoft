class Tipodoc < ActiveRecord::Base
  attr_accessible :sigla
  
  validates :sigla, :presence => true,
  :length => { :maximum => 2 }

  belongs_to :cliente

  belongs_to :cotizacion
end
