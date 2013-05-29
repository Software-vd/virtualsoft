class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.date :fecha
      t.string :nombres
      t.string :apellidos
      t.integer :factura_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
