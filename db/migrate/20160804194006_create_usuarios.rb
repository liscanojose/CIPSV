class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
    	t.string :correo
      	t.string :password_digest
      	t.string :nombre
      	t.string :apellido
      	t.string :telefono
      	t.integer :rol


      t.timestamps null: false
    end
  end
end
