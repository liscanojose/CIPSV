class AntecedentePerinatal < ActiveRecord::Base
  has_and_belongs_to_many :pacientes
end
