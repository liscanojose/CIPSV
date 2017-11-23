class CreateDesarrollos < ActiveRecord::Migration
  def change
    create_table :desarrollos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
