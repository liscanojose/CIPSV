class CreateSentidoEticos < ActiveRecord::Migration
  def change
    create_table :sentido_eticos do |t|
      t.string :nombre
      t.timestamps null: false
    end
  end
end
