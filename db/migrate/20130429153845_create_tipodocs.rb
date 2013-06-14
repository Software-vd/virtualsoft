class CreateTipodocs < ActiveRecord::Migration
  def change
    create_table :tipodocs do |t|
      t.string :sigla

      t.timestamps
    end
  end
end
