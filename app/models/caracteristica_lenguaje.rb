class CaracteristicaLenguaje < ActiveRecord::Base
  has_one :paciente
  has_one :lenguaje_cualitativo
  has_one :lenguaje_cuantitativo
  has_one :estado_animo_afectivo
end
