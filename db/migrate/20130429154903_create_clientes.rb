class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :tipodoc_id
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :telefono
      t.string :celular

      t.timestamps
    end
  end
end
