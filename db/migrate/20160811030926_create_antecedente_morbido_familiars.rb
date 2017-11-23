class CreateAntecedenteMorbidoFamiliars < ActiveRecord::Migration
  def change
    create_table :antecedente_morbido_familiars do |t|
      t.text :medico
      t.belongs_to :paciente , index:true
      t.text :psicologico
      t.string :toxico
      t.timestamps null: false
    end
  end
end
