class CreateAreaConducta < ActiveRecord::Migration
  def change
    create_table :area_conducta do |t|
      t.references :conduntum
      t.references :paciente
      t.string :respuesta
    end
    add_index :area_conducta , :conduntum_id
    add_index :area_conducta, :paciente_id
  end
end
