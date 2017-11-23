class CreateAntecedenteRecienNacidos < ActiveRecord::Migration
  def change
    create_table :antecedente_recien_nacidos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
