class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :tipodoc_id
      t.string :Numero_documento
      t.string :Nombres
      t.string :Apellidos
      t.string :Telefono
      t.string :Celular

      t.timestamps
    end
  end
end
