class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :codigo
      t.integer :tamano_id
      t.integer :tipo_id
      t.string :valor

      t.timestamps
    end
  end
end
