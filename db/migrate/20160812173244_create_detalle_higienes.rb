class CreateDetalleHigienes < ActiveRecord::Migration
  def change
    create_table :detalle_higienes do |t|
      t.references :paciente
      t.references :higiene
      t.string :respuesta
    end
    add_index :detalle_higienes, :higiene_id
    add_index :detalle_higienes, :paciente_id
  end
end
