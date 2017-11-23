class CreateCuestionarioDemoras < ActiveRecord::Migration
  def change
    create_table :cuestionario_demoras do |t|
      t.string :paciente_id
      t.string :resp_I1
      t.string :resp_I2
      t.string :resp_I3
      t.string :resp_I3
      t.string :resp_I4
      t.string :resp_I5
      t.string :resp_I6
      t.string :resp_J1
      t.string :resp_J2
      t.string :resp_J3
      t.string :resp_J4
      t.string :resp_J5
      t.string :resp_J6
      t.string :resp_J7
      t.string :resp_J8
      t.string :resp_J9
      t.string :resp_K1
      t.string :resp_K2
      t.string :resp_K3
      t.string :resp_K4
      t.string :resp_K5
      t.string :resp_K6
      t.string :resp_K7
      t.string :resp_L1
      t.string :resp_L2
      t.string :resp_L3
      t.string :resp_L4
      t.string :resp_L5
      t.string :resp_M1
      t.string :resp_M2
      t.string :resp_M3
      t.string :resp_M4
      t.string :resp_M5
      t.string :resp_M6
      t.string :resp_M7
      t.string :resp_M8
      t.string :resp_M9
      t.string :resp_M10
      t.string :resp_N1
      t.string :resp_N2
      t.string :resp_N3
      t.string :resp_N4
      t.string :resp_N5
      t.string :resp_N6
      t.string :resp_N7
      t.string :resp_N8
      t.string :resp_O1
      t.string :resp_O2
      t.string :resp_O3
      t.string :resp_O4
      t.string :resp_O5
      t.string :resp_O6
      t.string :resp_P1
      t.string :resp_P2
      t.string :resp_P3
      t.string :resp_P4
      t.string :resp_P5
      t.string :resp_P6
      t.timestamps null: false
    end
  end
end
