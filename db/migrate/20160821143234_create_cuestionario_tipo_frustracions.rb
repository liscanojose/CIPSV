class CreateCuestionarioTipoFrustracions < ActiveRecord::Migration
  def change
    create_table :cuestionario_tipo_frustracions do |t|

      t.belongs_to :paciente , index:true
      
      t.string :cedula
      t.integer :resp_A1
      t.string :resp_A2
      t.string :resp_A3
      t.string :resp_A4
      t.string :resp_A5
      t.string :resp_A6
      t.string :resp_B1
      t.string :resp_B2
      t.string :resp_B3
      t.string :resp_B4
      t.integer :resp_C1
      t.integer :resp_C2
      t.string :resp_C3

      t.timestamps null: false
    end
  end
end
