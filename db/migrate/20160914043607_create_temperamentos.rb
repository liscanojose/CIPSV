class CreateTemperamentos < ActiveRecord::Migration
  def change
    create_table :temperamentos do |t|
      t.string  :paciente_id
      t.boolean :agresividad
      t.boolean :insensibilidad
      t.boolean :impulsividad
      t.boolean :irritabilidad
      t.boolean :melancolia
      t.boolean :susceptibilidad
      t.boolean :sexualidad
      t.boolean :introversion
      t.timestamps null: false
    end
  end
end
