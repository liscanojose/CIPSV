class CreateDetalleHabitos < ActiveRecord::Migration
  def change
    create_table :detalle_habitos do |t|
      t.references :paciente
      t.references :habito
      t.string :respuesta
    end
    add_index :detalle_habitos, :habito_id
    add_index :detalle_habitos, :paciente_id
  end
end
