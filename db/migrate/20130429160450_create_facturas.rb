class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.string :fecha
      t.string :numero_factura
      t.string :nombres
      t.string :apellido
      t.string :cantidad
      t.string :producto_id
      t.integer :cotizacion_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
