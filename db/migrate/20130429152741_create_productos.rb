class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :descripcion
      t.string :valor

      t.timestamps
    end
  end
end
