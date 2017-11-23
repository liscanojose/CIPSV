class HistoriaFamiliar < ActiveRecord::Base
	 has_one :paciente
  	 has_one :padre
     has_one :madre
     has_many :familiars
end
