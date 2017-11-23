class CreateAntecedenteEmbarazos < ActiveRecord::Migration
  def change
    create_table :antecedente_embarazos do |t|
      t.references :paciente
      t.references :antecedente_prenatal
      t.string :respuesta
    end
    add_index :antecedente_embarazos, :paciente_id
    add_index :antecedente_embarazos, :antecedente_prenatal_id
  end
end
