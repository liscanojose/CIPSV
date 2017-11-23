class CuestionarioImpedimento < ActiveRecord::Base
	belongs_to :paciente
	validates :resp_A1 ,  presence: true
	validates :resp_A2 ,  presence: true
	validates :resp_A3 ,  presence: true
	validates :resp_A4 ,  presence: true
	validates :resp_A5 ,  presence: true
	validates :resp_A6 ,  presence: true
	validates :resp_A7 ,  presence: true
	validates :resp_A8 ,  presence: true
	validates :resp_B1 ,  presence: true
	validates :resp_B2 ,  presence: true
	validates :resp_B3 ,  presence: true
	validates :resp_B4 ,  presence: true
	validates :resp_B5 ,  presence: true
	validates :resp_B6 ,  presence: true
	validates :resp_B7 ,  presence: true
	validates :resp_B8 ,  presence: true
	validates :resp_B9 ,  presence: true
	validates :resp_C1 ,  presence: true
	validates :resp_C2 ,  presence: true
	validates :resp_C3 ,  presence: true
	validates :resp_C4 ,  presence: true
	validates :resp_C5 ,  presence: true
	validates :resp_C6 ,  presence: true
	validates :resp_D1 ,  presence: true
	validates :resp_D2 ,  presence: true
	validates :resp_D3 ,  presence: true
	validates :resp_D4 ,  presence: true
	validates :resp_D5 ,  presence: true
	validates :resp_D6 ,  presence: true
	validates :resp_D7 ,  presence: true
	validates :resp_D8 ,  presence: true
	validates :resp_E1 ,  presence: true
	validates :resp_E2 ,  presence: true
	validates :resp_E3 ,  presence: true
	validates :resp_E4 ,  presence: true
	validates :resp_E5 ,  presence: true
	validates :resp_E6 ,  presence: true
	validates :resp_E7 ,  presence: true
	validates :resp_E8 ,  presence: true
	validates :resp_E9 ,  presence: true
	validates :resp_F1 ,  presence: true
	validates :resp_F2 ,  presence: true
	validates :resp_F3 ,  presence: true
	validates :resp_F4 ,  presence: true
	validates :resp_F5 ,  presence: true
	validates :resp_F6 ,  presence: true
	validates :resp_F7 ,  presence: true
	validates :resp_F8 ,  presence: true
	validates :resp_F9 ,  presence: true
	validates :resp_G1 ,  presence: true
	validates :resp_G2 ,  presence: true
	validates :resp_G3 ,  presence: true
	validates :resp_G4 ,  presence: true
	validates :resp_G5 ,  presence: true
	validates :resp_G6 ,  presence: true
	validates :resp_H1 ,  presence: true
	validates :resp_H2 ,  presence: true
	validates :resp_H3 ,  presence: true
	validates :resp_H4 ,  presence: true
	validates :resp_H5 ,  presence: true
	validates :resp_H6 ,  presence: true

	

end
