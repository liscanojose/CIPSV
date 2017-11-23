class CreatePasatiempos < ActiveRecord::Migration
  def change
    create_table :pasatiempos do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
