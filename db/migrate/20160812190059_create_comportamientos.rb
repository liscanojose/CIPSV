class CreateComportamientos < ActiveRecord::Migration
  def change
    create_table :comportamientos do |t|
      t.boolean :adaptado
      t.boolean :cooperativo
      t.boolean :congraciativo
      t.boolean :tranquilo
      t.boolean :exitado
      t.boolean :agresivo
      t.string :otros

      t.timestamps null: false
    end
  end
end
