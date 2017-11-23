class CreateAntecedentesEconomicos < ActiveRecord::Migration
  def change
    create_table :antecedentes_economicos do |t|
      t.float :ingresoFamiliar
      t.integer :viviendaId
      t.belongs_to :paciente , index:true
      t.timestamps null: false
    end
  end
end
