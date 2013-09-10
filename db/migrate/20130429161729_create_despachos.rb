class CreateDespachos < ActiveRecord::Migration
  def change
    create_table :despachos do |t|
      t.string :fecha
      t.string :encargado
      t.integer :pagos_id

      t.timestamps
    end
  end
end
