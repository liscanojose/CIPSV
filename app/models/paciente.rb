class Paciente < ActiveRecord::Base
  validates :cedula, presence: true, uniqueness: {case_sensitive: false ,message: "Esta cédula ya fue registrada como paciente"}
  validates :nombres,  presence: true, length: { minimum: 2 , maximum: 50 }
  validates :apellidos,  presence: true, length: { minimum: 2 , maximum: 50 }
  validates :fechaNacimiento,  presence: true
  validates_length_of :edad, :maximum => 130, :minimum =>1
  validates :sexo,  presence: true
  validates :telefono,  presence: true, length: { maximum: 20 }
  validates :direccion,  presence: true, length: { maximum: 60 }




  
  
  has_one :antecedente_morbido_familiar
  belongs_to :antecedentes_economico
  belongs_to :area_sexual
  belongs_to :historial_familiar
  belongs_to :orientacion
  belongs_to :historia_familiar
  belongs_to :caracteristica_lenguaje
  has_and_belongs_to_many :antecedente_perinatals
  has_and_belongs_to_many :antecedente_prenatals
  has_and_belongs_to_many :antecedente_recien_nacidos
  has_and_belongs_to_many :conducta
  has_and_belongs_to_many :datos_actuales
  belongs_to :valoracion
  has_and_belongs_to_many :pensamientos
  has_and_belongs_to_many :pasatiempos
  has_and_belongs_to_many :sentido_eticos
  has_and_belongs_to_many :suennos
  belongs_to :dificultad_significativa
  has_and_belongs_to_many :expresion_emocionals
  has_and_belongs_to_many :habitos
  has_and_belongs_to_many :higienes
  has_and_belongs_to_many :dificultads
  has_many :cuestionario_tipo_frustracions
  has_many :cuestionario_impedimentos
  has_many :cuestionario_demoras
  has_many :cuestionario_conflictos
  has_one :temperamento
  has_and_belongs_to_many :desarrollos
end
