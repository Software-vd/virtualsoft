class CreateTamanos < ActiveRecord::Migration
  def change
    create_table :tamanos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
