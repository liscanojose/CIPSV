class CreateCronologiaDesarrollos < ActiveRecord::Migration
  def change
    create_table :cronologia_desarrollos do |t|
      t.references :paciente
      t.references :desarrollo
      t.string :descripion
      t.string :observaciones
    end
    add_index :cronologia_desarrollos , :desarrollo_id
    add_index :cronologia_desarrollos, :paciente_id
  end
end
