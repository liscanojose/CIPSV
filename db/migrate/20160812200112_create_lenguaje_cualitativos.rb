class CreateLenguajeCualitativos < ActiveRecord::Migration
  def change
    create_table :lenguaje_cualitativos do |t|
      t.boolean :prolijidad
      t.boolean :autoRecerencia
      t.boolean :inconsecuencia
      t.boolean :incoherencia
      t.boolean :neologismo
      t.boolean :bulbuceo
      t.boolean :tartamudeo
      t.string :otro
      t.timestamps null: false
    end
  end
end
