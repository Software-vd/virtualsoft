class Tipodoc < ActiveRecord::Base
  attr_accessible :sigla, :cliente_id
  
  validates :sigla, :presence => true,
  :length => { :maximum => 2 }

  validates :cliente_id, :presence => true,
  :length => { :maximum => 80 }

  belongs_to :cliente

  belongs_to :cotizacion
end
