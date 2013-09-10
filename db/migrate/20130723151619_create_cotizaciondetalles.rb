class CreateCotizaciondetalles < ActiveRecord::Migration
  def change
    create_table :cotizaciondetalles do |t|
      t.string :producto_id
      t.integer :cantidad
      t.integer :subtotal
      t.integer :cotizacion_id

      t.timestamps
    end
  end
end
