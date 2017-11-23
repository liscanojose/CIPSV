class CreateOrientacions < ActiveRecord::Migration
  def change
    create_table :orientacions do |t|
      t.belongs_to :paciente, index:true
      t.text :alopsiquica
      t.text :autopsiquica
      t.text :memoria
      t.text :aprendizaje
      t.text :atencionConcentracion
      t.text :procesamientoInformacion
      t.text :inteligencia
      t.text :observaciones
      t.timestamps null: false
    end
  end
end
