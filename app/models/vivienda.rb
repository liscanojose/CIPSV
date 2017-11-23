class Vivienda < ActiveRecord::Base
  has_one :servicio_basico
  has_one :tipo_propiedad
  has_one :tipo_vivienda
end
