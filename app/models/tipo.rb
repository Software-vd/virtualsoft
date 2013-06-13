class Tipo < ActiveRecord::Base
  attr_accessible :Descripcion
  
  validates :Descripcion :presence => true, 
  :length => { :maximum => 80 }

  belongs_to :producto
end

