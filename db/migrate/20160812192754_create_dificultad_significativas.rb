class CreateDificultadSignificativas < ActiveRecord::Migration
  def change
    create_table :dificultad_significativas do |t|
      t.belongs_to :paciente
      t.string     :observaciones
      t.string     :descripcion
      t.timestamps null: false
    end
  end
end
