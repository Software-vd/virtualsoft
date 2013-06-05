class CreateValores < ActiveRecord::Migration
  def change
    create_table :valores do |t|
      t.string :valor_unitario
      t.string :valor_total

      t.timestamps
    end
  end
end
