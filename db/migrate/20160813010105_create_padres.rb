class CreatePadres < ActiveRecord::Migration
  def change
     create_table :padres, id: false, primary_key: :cedula do |t|
   

      t.string :nombres
      t.string :apellidos
      t.string :cedula
      t.string :lugarNacimiento
      t.date :fechaNacimiento
      t.integer :edad
      t.string :sexo
      t.integer :telefono
      t.string :direccion
      t.string :gradoEscolar
      
      t.string :ocupacion
      t.string :situacionLaboral
      t.string :observaciones
      t.string :estadoCivil
      
      t.timestamps null: false
    end
  end
end