class CreateTamanos < ActiveRecord::Migration
  def change
    create_table :tamanos do |t|
      t.string :Sigla

      t.timestamps
    end
  end
end
