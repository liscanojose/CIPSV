class CreateDetalleSentidoEticos < ActiveRecord::Migration
  def change
    create_table :detalle_sentido_eticos do |t|
      t.string :respuesta
      t.references :paciente
      t.references :sentido_etico
    end
    add_index :detalle_sentido_eticos, :paciente_id
    add_index :detalle_sentido_eticos, :sentido_etico_id
  end
end
