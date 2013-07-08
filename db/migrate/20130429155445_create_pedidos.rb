class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :fecha
      t.string :numero_pedido
      t.string :cantidad
      t.integer :producto_id
      t.integer :cliente_id
      t.float :valor

      t.timestamps
    end
  end
end
