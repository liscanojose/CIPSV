class CreateValoracions < ActiveRecord::Migration
  def change
    create_table :valoracions do |t|
      t.belongs_to :conduncta_valoracion, index:true
      t.belongs_to :aspecto, index:true
      t.belongs_to :comportamiento, index:true
      t.belongs_to :paciente, index: true
      t.string :motivo
      t.timestamps null: false
    end
  end
end
