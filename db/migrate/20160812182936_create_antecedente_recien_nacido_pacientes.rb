class CreateAntecedenteRecienNacidoPacientes < ActiveRecord::Migration
  def change
    create_table :antecedente_recien_nacido_pacientes do |t|
      t.references :paciente
      t.references :antecedente_recien_nacido
      t.string :respuesta
    end
    add_index :antecedente_recien_nacido_pacientes, :paciente_id
    end
end
