class CreateEstadoAnimoAfectivos < ActiveRecord::Migration
  def change
    create_table :estado_animo_afectivos do |t|
      t.boolean :depresion
      t.boolean :elacion
      t.boolean :euforia
      t.boolean :suspicacia
      t.boolean :colera
      t.boolean :felicidad
      t.boolean :culpa
      t.boolean :miedo
      t.boolean :ansiedad
      t.boolean :panico
      t.boolean :calma
      t.boolean :hostilidad
      t.boolean :tristeza
      t.boolean :afliccion
      t.string :otro
      t.string :observaciones
      t.string :estadoAnimoAdecuado
      t.string :nivelIntensidadApropiado
      t.timestamps null: false
    end
  end
end
