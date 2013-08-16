class Tamano < ActiveRecord::Base
  attr_accessible :descripcion
  
  validates :descripcion, :presence => true,
  :length => { :maximum => 40 }

  belongs_to :producto
end
