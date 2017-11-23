class CreateDetalleExpresionEmocionals < ActiveRecord::Migration
  def change
    create_table :detalle_expresion_emocionals do |t|
      t.references :paciente
      t.references :expresion_emocional
      t.string :respuesta
    end
    add_index :detalle_expresion_emocionals, :expresion_emocional_id
    add_index :detalle_expresion_emocionals, :paciente_id
    end
end
