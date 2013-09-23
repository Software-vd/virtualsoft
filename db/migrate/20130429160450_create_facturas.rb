class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :fecha
      t.string :tipodoc_id
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :cantidad
      t.string :producto_id
      t.string :subtotal
      t.integer :cotizacion_id

      t.timestamps
    end
  end
end
