class CreateDatosActuales < ActiveRecord::Migration
  def change
    create_table :datos_actuales do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
