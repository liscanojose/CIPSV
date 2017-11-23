class CreateExpresionEmocionals < ActiveRecord::Migration
  def change
    create_table :expresion_emocionals do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
