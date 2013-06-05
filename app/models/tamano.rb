class Tamano < ActiveRecord::Base
  attr_accessible :descripcion

  belongs_to :producto
end
