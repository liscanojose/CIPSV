class CreateAspectos < ActiveRecord::Migration
  def change
    create_table :aspectos do |t|
      t.string :atuendo
      t.string :higienePersonal
      t.string :miradaExpresion
      t.string :postura
      t.timestamps null: false
    end
  end
end
