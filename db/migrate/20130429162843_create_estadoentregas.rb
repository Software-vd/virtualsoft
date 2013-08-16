class CreateEstadoentregas < ActiveRecord::Migration
  def change
    create_table :estadoentregas do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
