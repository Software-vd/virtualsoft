class CreateCotizaciondetalles < ActiveRecord::Migration
  def change
    create_table :cotizaciondetalles do |t|
      t.string :producto_id
      t.float :cantidad
      t.float :subtotal

      t.timestamps
    end
  end
end
