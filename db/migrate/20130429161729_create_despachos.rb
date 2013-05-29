class CreateDespachos < ActiveRecord::Migration
  def change
    create_table :despachos do |t|
      t.date :fecha
      t.string :encargado
      t.integer :pagos_id
      t.integer :estado_entrega_id

      t.timestamps
    end
  end
end
