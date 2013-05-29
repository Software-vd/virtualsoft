class CreateCotizaciones < ActiveRecord::Migration
  def change
    create_table :cotizaciones do |t|
      t.date :fecha
      t.string :numero_cotizacion
      t.integer :tipodoc_id
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.integer :producto_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
