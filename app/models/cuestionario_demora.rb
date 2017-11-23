class CuestionarioDemora < ActiveRecord::Base
  belongs_to :paciente
  validates :resp_I1 ,  presence: true
  validates :resp_I2 ,  presence: true
  validates :resp_I3 ,  presence: true
  validates :resp_I4 ,  presence: true
  validates :resp_I5 ,  presence: true
  validates :resp_I6 ,  presence: true  
  validates :resp_J1 ,  presence: true
  validates :resp_J2 ,  presence: true
  validates :resp_J3 ,  presence: true
  validates :resp_J4 ,  presence: true
  validates :resp_J5 ,  presence: true
  validates :resp_J6 ,  presence: true
  validates :resp_J7 ,  presence: true
  validates :resp_J8 ,  presence: true
  validates :resp_J9 ,  presence: true
  validates :resp_K1 ,  presence: true
  validates :resp_K2 ,  presence: true
  validates :resp_K3 ,  presence: true
  validates :resp_K4 ,  presence: true
  validates :resp_K5 ,  presence: true
  validates :resp_K6 ,  presence: true
  validates :resp_K7 ,  presence: true
  validates :resp_L1 ,  presence: true
  validates :resp_L2 ,  presence: true
  validates :resp_L3 ,  presence: true
  validates :resp_L4 ,  presence: true
  validates :resp_L5 ,  presence: true  
  validates :resp_M1 ,  presence: true
  validates :resp_M2 ,  presence: true
  validates :resp_M3 ,  presence: true
  validates :resp_M4 ,  presence: true
  validates :resp_M5 ,  presence: true
  validates :resp_M6 ,  presence: true
  validates :resp_M7 ,  presence: true
  validates :resp_M8 ,  presence: true
  validates :resp_M9 ,  presence: true
  validates :resp_M10 ,  presence: true  
  validates :resp_N1 ,  presence: true
  validates :resp_N2 ,  presence: true
  validates :resp_N3 ,  presence: true
  validates :resp_N4 ,  presence: true
  validates :resp_N5 ,  presence: true
  validates :resp_N6 ,  presence: true
  validates :resp_N7 ,  presence: true
  validates :resp_N8 ,  presence: true  
  validates :resp_O1 ,  presence: true
  validates :resp_O2 ,  presence: true
  validates :resp_O3 ,  presence: true
  validates :resp_O4 ,  presence: true
  validates :resp_O5 ,  presence: true
  validates :resp_O6 ,  presence: true
  validates :resp_P1 ,  presence: true
  validates :resp_P2 ,  presence: true
  validates :resp_P3 ,  presence: true
  validates :resp_P4 ,  presence: true
  validates :resp_P5 ,  presence: true
  validates :resp_P6 ,  presence: true


  

end
