class CreateContenidoPensamientos < ActiveRecord::Migration
  def change
    create_table :contenido_pensamientos do |t|
      t.references :pensamiento
      t.references :paciente
      t.string :respuesta
    end
    add_index :contenido_pensamientos , :paciente_id
    add_index :contenido_pensamientos, :pensamiento_id

  end
end
