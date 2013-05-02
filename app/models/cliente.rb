class Cliente < ActiveRecord::Base
  attr_accessible :Apellidos, :Celular, :Nombres, :Numero_documento, :Telefono, :tipodoc_id
end
