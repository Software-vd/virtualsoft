class CreateValores < ActiveRecord::Migration
  def change
    create_table :valores do |t|
      t.float :valor_unitario
      t.float :valor_total

      t.timestamps
    end
  end
end
