class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.date :fecha
      t.string :numero_pedido
      t.string :cantidad
      t.integer :producto_id
      t.integer :cliente_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
