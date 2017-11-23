class CreateLenguajeCuantitativos < ActiveRecord::Migration
  def change
    create_table :lenguaje_cuantitativos do |t|
      t.boolean :hablaIncesante
      t.string :observacionHablaIncesante
      t.boolean :hablaAcorde
      t.string :observacionHablaAcorde
      t.boolean :hablaPoco
      t.string :observacionHablaPoco
      t.string :observacionesGenerales
      t.timestamps null: false
    end
  end
end
