class CuestionarioTipoFrustracion < ActiveRecord::Base
	belongs_to :paciente
	validates_length_of :resp_A1, :maximum => 10, :minimum =>1,  presence: true
	validates :resp_A2,  presence: true
	validates :resp_A3,  presence: true
	validates :resp_A4,  presence: true
	validates :resp_A5,  presence: true
	validates :resp_A6,  presence: true
	validates :resp_B1,  presence: true
	validates :resp_B2,  presence: true
	validates :resp_B3,  presence: true
	validates :resp_B4,  presence: true
	validates_length_of :resp_C1, :maximum => 10, :minimum =>1,  presence: true
	validates_length_of :resp_C2, :maximum => 10, :minimum =>1,  presence: true
	validates :resp_C3,  presence: true

end
