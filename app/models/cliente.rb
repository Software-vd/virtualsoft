class Cliente < ActiveRecord::Base
  attr_accessible :apellidos, :celular, :nombres, :numero_documento, :telefono, :tipodoc_id
 
  def self.search(search)
    where('nombres like ?', "%#{search}%")
  end

  has_many :tipodocs

  has_many :pedidos

end
