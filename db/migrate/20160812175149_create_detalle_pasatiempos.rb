class CreateDetallePasatiempos < ActiveRecord::Migration
  def change
    create_table :detalle_pasatiempos do |t|
      t.references :paciente
      t.references :pasatiempo
      t.string :respuesta
    end
    add_index :detalle_pasatiempos, :pasatiempo_id
    add_index :detalle_pasatiempos, :paciente_id
  end
end
