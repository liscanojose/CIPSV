class CreateHistorialFamiliars < ActiveRecord::Migration
   def change
    create_table :historia_familiars do |t|
    	
      t.belongs_to :padre ,index:true
      t.belongs_to :madre ,index:true
      t.belongs_to :paciente, index: true
      t.timestamps null: false
    end
  end
end
