class Cliente < ActiveRecord::Base
  attr_accessible :apellidos, :celular, :nombres, :numero_documento, :telefono, :tipodoc_id
 
  def self.search(search)
    where('nombres like ?', "%#{search}%")
  end
  
  validates :numero_documento, :presence => true,
  :length => { :minimum => 6, :maximum => 15 },
  :numericality => true

  validates :nombres, :apellidos, :presence => true,
  :length => { :maximum => 80 }

  validates :telefono, :presence => true,
  :length => { :maximum => 7 }

  validates :celular, :presence => true,
  :length => { :maximum => 10 }

  validates :tipodoc_id, :presence => true,
  :length => { :maximum => 2 }



  has_many :tipodocs

  has_many :pedidos

end
