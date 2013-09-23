class CreateCotizaciondetalles < ActiveRecord::Migration
  def change
    create_table :cotizaciondetalles do |t|
      t.string :producto_id
      t.string :cantidad
      t.string :subtotal
      t.integer :cotizacion_id

      t.timestamps
    end
  end
end
