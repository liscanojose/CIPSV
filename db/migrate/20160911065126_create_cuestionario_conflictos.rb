class CreateCuestionarioConflictos < ActiveRecord::Migration
  def change
    create_table :cuestionario_conflictos do |t|
      t.string :paciente_id
      t.string :resp_Q1
      t.string :resp_Q2
      t.string :resp_Q3
      t.string :resp_Q3
      t.string :resp_Q4
      t.string :resp_Q5
      t.string :resp_Q6
      t.string :resp_Q7
      t.string :resp_R1
      t.string :resp_R2
      t.string :resp_R3
      t.string :resp_R4
      t.string :resp_R5
      t.string :resp_R6
      t.string :resp_R7
      t.string :resp_R8
      t.string :resp_R9
      t.string :resp_R10
      t.string :resp_S1
      t.string :resp_S2
      t.string :resp_S3
      t.string :resp_S4
      t.string :resp_S5
      t.string :resp_S6
      t.string :resp_S7
      t.string :resp_T1
      t.string :resp_T2
      t.string :resp_T3
      t.string :resp_T4
      t.string :resp_T5
      t.string :resp_T6
      t.string :resp_U1
      t.string :resp_U2
      t.string :resp_U3
      t.string :resp_U4
      t.string :resp_U5
      t.string :resp_U6
      t.string :resp_U7
      t.string :resp_U8
      t.string :resp_U9
      t.string :resp_V1
      t.string :resp_V2
      t.string :resp_V3
      t.string :resp_V4
      t.string :resp_V5
      t.string :resp_V6
      t.string :resp_V7
      t.string :resp_V8
      t.string :resp_V9
      t.string :resp_V10
      t.string :resp_W1
      t.string :resp_W2
      t.string :resp_W3
      t.string :resp_W4
      t.string :resp_W5
      t.string :resp_W6
      t.string :resp_X1
      t.string :resp_X2
      t.string :resp_X3
      t.string :resp_X4
      t.string :resp_X5
      t.string :resp_X6
      t.string :resp_X7
      t.timestamps null: false
    end
  end
end
