class CreateHigienes < ActiveRecord::Migration
  def change
    create_table :higienes do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
