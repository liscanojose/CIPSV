class CreateConductaValoracions < ActiveRecord::Migration
  def change
    create_table :conducta_valoracions do |t|
      t.boolean :coopera
      t.boolean :franco
      t.boolean :temeroso
      t.boolean :abierto
      t.boolean :hostil
      t.boolean :reticiente
      t.string :otros
      t.string :observaciones
      t.timestamps null: false
    end
  end
end
