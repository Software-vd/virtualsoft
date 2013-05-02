class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.date :Fecha
      t.string :Numero_pedido
      t.string :Cantidad
      t.integer :producto_id
      t.integer :cliente_id
      t.integer :valor_id

      t.timestamps
    end
  end
end
