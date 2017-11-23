class Valoracion < ActiveRecord::Base
  has_one :paciente
  has_one :aspecto
  has_one :conducta_valoracion
  has_one :comportamiento
end
