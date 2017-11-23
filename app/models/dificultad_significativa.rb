class DificultadSignificativa < ActiveRecord::Base
  has_one :paciente
  has_and_belongs_to_many :dificultads
end
