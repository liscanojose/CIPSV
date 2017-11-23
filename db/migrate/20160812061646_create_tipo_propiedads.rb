class CreateTipoPropiedads < ActiveRecord::Migration
  def change
    create_table :tipo_propiedads do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
