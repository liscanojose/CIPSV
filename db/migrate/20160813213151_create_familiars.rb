class CreateFamiliars < ActiveRecord::Migration
  def change
    create_table :familiars do |t|

      t.belongs_to :historia_familiar, index: true
      
      t.string :nombre
      t.string :apellido
      t.string :parentesco
      t.integer :edad
      t.string :ocupacion
      t.string :observaciones
      t.string :gradoConsaguinidad
      
      t.timestamps null: false
    end

  end
end
