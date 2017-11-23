class CreateConducta < ActiveRecord::Migration
  def change
    create_table :conducta do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
