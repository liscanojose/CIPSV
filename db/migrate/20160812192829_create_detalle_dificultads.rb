class CreateDetalleDificultads < ActiveRecord::Migration
  def change
    create_table :detalle_dificultads do |t|
      t.references :dificultad_significativa
      t.references :dificultad
      t.string :respuesta
    end
    add_index :detalle_dificultads , :dificultad_id
    add_index :detalle_dificultads, :dificultad_significativa_id
    end
end
