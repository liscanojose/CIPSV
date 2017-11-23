class Dificultad < ActiveRecord::Base
  has_and_belongs_to_many :dificultad_significativas
end
