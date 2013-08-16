class CreateTipodocs < ActiveRecord::Migration
  def change
    create_table :tipodocs do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
