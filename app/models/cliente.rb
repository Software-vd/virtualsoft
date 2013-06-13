class Cliente < ActiveRecord::Base
  attr_accessible :apellidos, :celular, :nombres, :numero_documento, :telefono, :tipodoc_id
 
  def self.search(search)
    where('nombres like ?', "%#{search}%")
  end
  
  validates_uniqueness_of :tipodoc_id
  validates_presence_of :numero_documento
  validates_presence_of :nombres
  validates_presence_of :apellidos
  validates_presence_of :celular
  validates_presence_of :telefono
        
  has_many :tipodocs

  has_many :pedidos

end
