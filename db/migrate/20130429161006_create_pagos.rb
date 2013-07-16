class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.string :fecha
      t.string :nombres
      t.string :apellidos
      t.integer :estado_entrega_id
      t.string :valor

      t.timestamps
    end
  end
end
