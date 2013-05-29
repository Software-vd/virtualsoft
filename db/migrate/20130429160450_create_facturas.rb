class CreateFacturas < ActiveRecord::Migration
  def change
    create_table :facturas do |t|
      t.date :fecha
      t.string :numero_factura
      t.string :nombres
      t.string :apellido
      t.string :cantidad
      t.string :productos
      t.integer :cotizacion_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
