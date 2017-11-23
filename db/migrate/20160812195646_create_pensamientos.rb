class CreatePensamientos < ActiveRecord::Migration
  def change
    create_table :pensamientos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
