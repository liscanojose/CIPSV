class CreateViviendas < ActiveRecord::Migration
  def change
    create_table :viviendas do |t|
      t.belongs_to :tipo_vivienda, index:true
      t.belongs_to :tipo_propiedad, index:true
      t.belongs_to :servivcio_basico, index:true
      t.timestamps null: false
    end
  end
end
