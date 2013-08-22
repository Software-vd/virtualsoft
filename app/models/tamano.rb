class Tamano < ActiveRecord::Base
  attr_accessible :descripcion

  validates_presence_of :descripcion

  belongs_to :producto
end
