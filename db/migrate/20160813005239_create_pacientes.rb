class CreatePacientes < ActiveRecord::Migration
    def change
        create_table :pacientes, id: false do |t|
            #t.string :cedula, primary_key: true tambien sirve

            t.string :nombres
            t.string :apellidos
            t.string :cedula
            t.string :lugarNacimiento
            t.date :fechaNacimiento
            t.integer :edad
            t.string :sexo
            t.string :telefono
            t.string :direccion
            t.string :gradoEscolar
            t.string :repitiente
            t.string :suministradorDatos
            t.string :circunstanciaSignificativa
            t.string :observacionHabitos
            t.string :observacionesContenidoPensamiento
            t.string :institucionEscolar
            t.integer :historialFamiliarId
            t.integer :antecedenteMorbidoFamiliarId
            t.integer :antecedetesEconomicosId
            t.integer :areaSexualId
            t.integer :orientacionId
            t.integer :cuestionario_tipo_frustracion_id
            t.integer :cuestionario_impedimento_id
            t.integer :cuestionario_conflicto_id
            t.integer :cuestionario_demora_id
            t.integer :temperamento_id
            t.timestamps null: false
        end
        execute "ALTER TABLE pacientes ADD PRIMARY KEY (cedula);"
    end
end

