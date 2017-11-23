class CreateAntecedentePerinatals < ActiveRecord::Migration
  def change
    create_table :antecedente_perinatals do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
