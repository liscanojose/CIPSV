class CreateAntecedentePartos < ActiveRecord::Migration
  def change
    create_table :antecedente_partos do |t|
      t.references :paciente
      t.references :antecedente_parinatal
      t.string :respuesta
    end
    add_index :antecedente_partos , :paciente_id
    add_index :antecedente_partos, :antecedente_parinatal_id
  end
end
