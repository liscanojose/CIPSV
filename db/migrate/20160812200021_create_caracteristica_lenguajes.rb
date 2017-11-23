class CreateCaracteristicaLenguajes < ActiveRecord::Migration
  def change
    create_table :caracteristica_lenguajes do |t|
      t.belongs_to :lenguaje_cualitativo, index:true
      t.belongs_to :lenguaje_cuantitativo, index:true
      t.belongs_to :estado_animo_afectivo, index:true
      t.belongs_to :paciente, index: true
      t.timestamps null: false
    end
  end
end
