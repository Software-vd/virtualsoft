class Tipodoc < ActiveRecord::Base
  attr_accessible :sigla, :cliente_id

  belongs_to :cliente
end
