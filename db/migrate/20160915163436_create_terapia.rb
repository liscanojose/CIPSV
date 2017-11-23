class CreateTerapia < ActiveRecord::Migration
  def change
    create_table :terapia do |t|
      t.string :temperamento
      t.string :terapia
      t.timestamps null: false
    end
  end
end
