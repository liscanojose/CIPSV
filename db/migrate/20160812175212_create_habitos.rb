class CreateHabitos < ActiveRecord::Migration
  def change
    create_table :habitos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
