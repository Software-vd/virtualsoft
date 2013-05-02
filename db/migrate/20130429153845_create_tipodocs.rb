class CreateTipodocs < ActiveRecord::Migration
  def change
    create_table :tipodocs do |t|
      t.string :Sigla
      t.integer :cliente_id

      t.timestamps
    end
  end
end
