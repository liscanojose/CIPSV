class CreateCuestionarioImpedimentos < ActiveRecord::Migration
  def change
    create_table :cuestionario_impedimentos do |t|
      t.string :paciente_id
      t.string :resp_A1
      t.string :resp_A2
      t.string :resp_A3
      t.string :resp_A3
      t.string :resp_A4
      t.string :resp_A5
      t.string :resp_A6
      t.string :resp_A7
      t.string :resp_A8
      t.string :resp_B1
      t.string :resp_B2
      t.string :resp_B3
      t.string :resp_B4
      t.string :resp_B5
      t.string :resp_B6
      t.string :resp_B7
      t.string :resp_B8
      t.string :resp_B9
      t.string :resp_C1
      t.string :resp_C2
      t.string :resp_C3
      t.string :resp_C4
      t.string :resp_C5
      t.string :resp_C6
      t.string :resp_D1
      t.string :resp_D2
      t.string :resp_D3
      t.string :resp_D4
      t.string :resp_D5
      t.string :resp_D6
      t.string :resp_D7
      t.string :resp_D8
      t.string :resp_E1
      t.string :resp_E2
      t.string :resp_E3
      t.string :resp_E4
      t.string :resp_E5
      t.string :resp_E6
      t.string :resp_E7
      t.string :resp_E8
      t.string :resp_E9
      t.string :resp_F1
      t.string :resp_F2
      t.string :resp_F3
      t.string :resp_F4
      t.string :resp_F5
      t.string :resp_F6
      t.string :resp_F7
      t.string :resp_F8
      t.string :resp_F9
      t.string :resp_G1
      t.string :resp_G2
      t.string :resp_G3
      t.string :resp_G4
      t.string :resp_G5
      t.string :resp_G6
      t.string :resp_H1
      t.string :resp_H2
      t.string :resp_H3
      t.string :resp_H4
      t.string :resp_H5
      t.string :resp_H6

      t.timestamps null: false
    end
  end
end
