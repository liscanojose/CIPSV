class CreateAntecedentePrenatals < ActiveRecord::Migration
  def change
    create_table :antecedente_prenatals do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
