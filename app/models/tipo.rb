class Tipo < ActiveRecord::Base
  attr_accessible :Descripcion
  
  belongs_to :producto
end

