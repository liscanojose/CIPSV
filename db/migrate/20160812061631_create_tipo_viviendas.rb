class CreateTipoViviendas < ActiveRecord::Migration
  def change
    create_table :tipo_viviendas do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
