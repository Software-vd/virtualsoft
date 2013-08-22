class Tipo < ActiveRecord::Base
  attr_accessible :Descripcion
  
  validates :Descripcion, :presence => true, 
  :length => { :maximum => 80 }

  validates_presence_of :Descripcion

  belongs_to :producto
end

