class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :tipo_id
      t.integer :tamano_id
      t.string :descripcion
      t.string :valor

      t.timestamps
    end
  end
end
