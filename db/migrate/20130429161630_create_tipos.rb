class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :Descripcion

      t.timestamps
    end
  end
end
