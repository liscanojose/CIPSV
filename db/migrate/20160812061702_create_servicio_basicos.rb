class CreateServicioBasicos < ActiveRecord::Migration
  def change
    create_table :servicio_basicos do |t|
      t.boolean :alcantarillado
      t.boolean :aguaPotable
      t.boolean :luz
      t.boolean :internet
      t.boolean :telefono
      t.timestamps null: false
    end
  end
end
