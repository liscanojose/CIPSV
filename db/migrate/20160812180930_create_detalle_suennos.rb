class CreateDetalleSuennos < ActiveRecord::Migration
  def change
    create_table :detalle_suennos do |t|
      t.references :paciente
      t.references :suenno
      t.string :respuesta
    end
    add_index :detalle_suennos , :suenno_id
    add_index :detalle_suennos, :paciente_id
  end
end
