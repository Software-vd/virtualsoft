class CreateCotizaciones < ActiveRecord::Migration
  def change
    create_table :cotizaciones do |t|
      t.string :ciudad
      t.string :fecha
      t.string :numero_cotizacion
      t.integer :tipodoc_id
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :direccion
      t.string :telefono
      t.integer :cliente_id

      t.timestamps
    end
  end
end
