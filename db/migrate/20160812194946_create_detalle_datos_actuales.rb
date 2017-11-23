class CreateDetalleDatosActuales < ActiveRecord::Migration
  def change
    create_table :detalle_datos_actuales do |t|
      t.references :datos_actuale
      t.references :paciente
      t.string :respuesta
    end
    add_index :detalle_datos_actuales , :datos_actuale_id
    add_index :detalle_datos_actuales, :paciente_id
  end
end
