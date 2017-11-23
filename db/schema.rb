# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160915163436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "antecedente_embarazos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "antecedente_prenatal_id"
    t.string  "respuesta"
  end

  add_index "antecedente_embarazos", ["antecedente_prenatal_id"], name: "index_antecedente_embarazos_on_antecedente_prenatal_id", using: :btree
  add_index "antecedente_embarazos", ["paciente_id"], name: "index_antecedente_embarazos_on_paciente_id", using: :btree

  create_table "antecedente_morbido_familiars", force: :cascade do |t|
    t.text     "medico"
    t.integer  "paciente_id"
    t.text     "psicologico"
    t.string   "toxico"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "antecedente_morbido_familiars", ["paciente_id"], name: "index_antecedente_morbido_familiars_on_paciente_id", using: :btree

  create_table "antecedente_partos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "antecedente_parinatal_id"
    t.string  "respuesta"
  end

  add_index "antecedente_partos", ["antecedente_parinatal_id"], name: "index_antecedente_partos_on_antecedente_parinatal_id", using: :btree
  add_index "antecedente_partos", ["paciente_id"], name: "index_antecedente_partos_on_paciente_id", using: :btree

  create_table "antecedente_perinatals", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antecedente_prenatals", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antecedente_recien_nacido_pacientes", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "antecedente_recien_nacido_id"
    t.string  "respuesta"
  end

  add_index "antecedente_recien_nacido_pacientes", ["paciente_id"], name: "index_antecedente_recien_nacido_pacientes_on_paciente_id", using: :btree

  create_table "antecedente_recien_nacidos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antecedentes_economicos", force: :cascade do |t|
    t.float    "ingresoFamiliar"
    t.integer  "viviendaId"
    t.integer  "paciente_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "antecedentes_economicos", ["paciente_id"], name: "index_antecedentes_economicos_on_paciente_id", using: :btree

  create_table "area_conducta", force: :cascade do |t|
    t.integer "conduntum_id"
    t.integer "paciente_id"
    t.string  "respuesta"
  end

  add_index "area_conducta", ["conduntum_id"], name: "index_area_conducta_on_conduntum_id", using: :btree
  add_index "area_conducta", ["paciente_id"], name: "index_area_conducta_on_paciente_id", using: :btree

  create_table "area_sexuals", force: :cascade do |t|
    t.text     "observaciones"
    t.string   "activoSexual"
    t.integer  "edadActivoSexual"
    t.text     "frecuenciaActividadSexual"
    t.string   "onanismo"
    t.integer  "edadOnanismo"
    t.text     "frecuenciaOnanismo"
    t.integer  "paciente_id"
    t.text     "orientacionSexual"
    t.text     "primeraExperiencia"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "area_sexuals", ["paciente_id"], name: "index_area_sexuals_on_paciente_id", using: :btree

  create_table "aspectos", force: :cascade do |t|
    t.string   "atuendo"
    t.string   "higienePersonal"
    t.string   "miradaExpresion"
    t.string   "postura"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "caracteristica_lenguajes", force: :cascade do |t|
    t.integer  "lenguaje_cualitativo_id"
    t.integer  "lenguaje_cuantitativo_id"
    t.integer  "estado_animo_afectivo_id"
    t.integer  "paciente_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "caracteristica_lenguajes", ["estado_animo_afectivo_id"], name: "index_caracteristica_lenguajes_on_estado_animo_afectivo_id", using: :btree
  add_index "caracteristica_lenguajes", ["lenguaje_cualitativo_id"], name: "index_caracteristica_lenguajes_on_lenguaje_cualitativo_id", using: :btree
  add_index "caracteristica_lenguajes", ["lenguaje_cuantitativo_id"], name: "index_caracteristica_lenguajes_on_lenguaje_cuantitativo_id", using: :btree
  add_index "caracteristica_lenguajes", ["paciente_id"], name: "index_caracteristica_lenguajes_on_paciente_id", using: :btree

  create_table "comportamientos", force: :cascade do |t|
    t.boolean  "adaptado"
    t.boolean  "cooperativo"
    t.boolean  "congraciativo"
    t.boolean  "tranquilo"
    t.boolean  "exitado"
    t.boolean  "agresivo"
    t.string   "otros"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "conducta", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conducta_valoracions", force: :cascade do |t|
    t.boolean  "coopera"
    t.boolean  "franco"
    t.boolean  "temeroso"
    t.boolean  "abierto"
    t.boolean  "hostil"
    t.boolean  "reticiente"
    t.string   "otros"
    t.string   "observaciones"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contenido_pensamientos", force: :cascade do |t|
    t.integer "pensamiento_id"
    t.integer "paciente_id"
    t.string  "respuesta"
  end

  add_index "contenido_pensamientos", ["paciente_id"], name: "index_contenido_pensamientos_on_paciente_id", using: :btree
  add_index "contenido_pensamientos", ["pensamiento_id"], name: "index_contenido_pensamientos_on_pensamiento_id", using: :btree

  create_table "cronologia_desarrollos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "desarrollo_id"
    t.string  "descripion"
    t.string  "observaciones"
  end

  add_index "cronologia_desarrollos", ["desarrollo_id"], name: "index_cronologia_desarrollos_on_desarrollo_id", using: :btree
  add_index "cronologia_desarrollos", ["paciente_id"], name: "index_cronologia_desarrollos_on_paciente_id", using: :btree

  create_table "cuestionario_conflictos", force: :cascade do |t|
    t.string   "paciente_id"
    t.string   "resp_Q1"
    t.string   "resp_Q2"
    t.string   "resp_Q3"
    t.string   "resp_Q4"
    t.string   "resp_Q5"
    t.string   "resp_Q6"
    t.string   "resp_Q7"
    t.string   "resp_R1"
    t.string   "resp_R2"
    t.string   "resp_R3"
    t.string   "resp_R4"
    t.string   "resp_R5"
    t.string   "resp_R6"
    t.string   "resp_R7"
    t.string   "resp_R8"
    t.string   "resp_R9"
    t.string   "resp_R10"
    t.string   "resp_S1"
    t.string   "resp_S2"
    t.string   "resp_S3"
    t.string   "resp_S4"
    t.string   "resp_S5"
    t.string   "resp_S6"
    t.string   "resp_S7"
    t.string   "resp_T1"
    t.string   "resp_T2"
    t.string   "resp_T3"
    t.string   "resp_T4"
    t.string   "resp_T5"
    t.string   "resp_T6"
    t.string   "resp_U1"
    t.string   "resp_U2"
    t.string   "resp_U3"
    t.string   "resp_U4"
    t.string   "resp_U5"
    t.string   "resp_U6"
    t.string   "resp_U7"
    t.string   "resp_U8"
    t.string   "resp_U9"
    t.string   "resp_V1"
    t.string   "resp_V2"
    t.string   "resp_V3"
    t.string   "resp_V4"
    t.string   "resp_V5"
    t.string   "resp_V6"
    t.string   "resp_V7"
    t.string   "resp_V8"
    t.string   "resp_V9"
    t.string   "resp_V10"
    t.string   "resp_W1"
    t.string   "resp_W2"
    t.string   "resp_W3"
    t.string   "resp_W4"
    t.string   "resp_W5"
    t.string   "resp_W6"
    t.string   "resp_X1"
    t.string   "resp_X2"
    t.string   "resp_X3"
    t.string   "resp_X4"
    t.string   "resp_X5"
    t.string   "resp_X6"
    t.string   "resp_X7"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cuestionario_demoras", force: :cascade do |t|
    t.string   "paciente_id"
    t.string   "resp_I1"
    t.string   "resp_I2"
    t.string   "resp_I3"
    t.string   "resp_I4"
    t.string   "resp_I5"
    t.string   "resp_I6"
    t.string   "resp_J1"
    t.string   "resp_J2"
    t.string   "resp_J3"
    t.string   "resp_J4"
    t.string   "resp_J5"
    t.string   "resp_J6"
    t.string   "resp_J7"
    t.string   "resp_J8"
    t.string   "resp_J9"
    t.string   "resp_K1"
    t.string   "resp_K2"
    t.string   "resp_K3"
    t.string   "resp_K4"
    t.string   "resp_K5"
    t.string   "resp_K6"
    t.string   "resp_K7"
    t.string   "resp_L1"
    t.string   "resp_L2"
    t.string   "resp_L3"
    t.string   "resp_L4"
    t.string   "resp_L5"
    t.string   "resp_M1"
    t.string   "resp_M2"
    t.string   "resp_M3"
    t.string   "resp_M4"
    t.string   "resp_M5"
    t.string   "resp_M6"
    t.string   "resp_M7"
    t.string   "resp_M8"
    t.string   "resp_M9"
    t.string   "resp_M10"
    t.string   "resp_N1"
    t.string   "resp_N2"
    t.string   "resp_N3"
    t.string   "resp_N4"
    t.string   "resp_N5"
    t.string   "resp_N6"
    t.string   "resp_N7"
    t.string   "resp_N8"
    t.string   "resp_O1"
    t.string   "resp_O2"
    t.string   "resp_O3"
    t.string   "resp_O4"
    t.string   "resp_O5"
    t.string   "resp_O6"
    t.string   "resp_P1"
    t.string   "resp_P2"
    t.string   "resp_P3"
    t.string   "resp_P4"
    t.string   "resp_P5"
    t.string   "resp_P6"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cuestionario_impedimentos", force: :cascade do |t|
    t.string   "paciente_id"
    t.string   "resp_A1"
    t.string   "resp_A2"
    t.string   "resp_A3"
    t.string   "resp_A4"
    t.string   "resp_A5"
    t.string   "resp_A6"
    t.string   "resp_A7"
    t.string   "resp_A8"
    t.string   "resp_B1"
    t.string   "resp_B2"
    t.string   "resp_B3"
    t.string   "resp_B4"
    t.string   "resp_B5"
    t.string   "resp_B6"
    t.string   "resp_B7"
    t.string   "resp_B8"
    t.string   "resp_B9"
    t.string   "resp_C1"
    t.string   "resp_C2"
    t.string   "resp_C3"
    t.string   "resp_C4"
    t.string   "resp_C5"
    t.string   "resp_C6"
    t.string   "resp_D1"
    t.string   "resp_D2"
    t.string   "resp_D3"
    t.string   "resp_D4"
    t.string   "resp_D5"
    t.string   "resp_D6"
    t.string   "resp_D7"
    t.string   "resp_D8"
    t.string   "resp_E1"
    t.string   "resp_E2"
    t.string   "resp_E3"
    t.string   "resp_E4"
    t.string   "resp_E5"
    t.string   "resp_E6"
    t.string   "resp_E7"
    t.string   "resp_E8"
    t.string   "resp_E9"
    t.string   "resp_F1"
    t.string   "resp_F2"
    t.string   "resp_F3"
    t.string   "resp_F4"
    t.string   "resp_F5"
    t.string   "resp_F6"
    t.string   "resp_F7"
    t.string   "resp_F8"
    t.string   "resp_F9"
    t.string   "resp_G1"
    t.string   "resp_G2"
    t.string   "resp_G3"
    t.string   "resp_G4"
    t.string   "resp_G5"
    t.string   "resp_G6"
    t.string   "resp_H1"
    t.string   "resp_H2"
    t.string   "resp_H3"
    t.string   "resp_H4"
    t.string   "resp_H5"
    t.string   "resp_H6"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cuestionario_tipo_frustracions", force: :cascade do |t|
    t.integer  "paciente_id"
    t.string   "cedula"
    t.integer  "resp_A1"
    t.string   "resp_A2"
    t.string   "resp_A3"
    t.string   "resp_A4"
    t.string   "resp_A5"
    t.string   "resp_A6"
    t.string   "resp_B1"
    t.string   "resp_B2"
    t.string   "resp_B3"
    t.string   "resp_B4"
    t.integer  "resp_C1"
    t.integer  "resp_C2"
    t.string   "resp_C3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cuestionario_tipo_frustracions", ["paciente_id"], name: "index_cuestionario_tipo_frustracions_on_paciente_id", using: :btree

  create_table "datos_actuales", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "desarrollos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_datos_actuales", force: :cascade do |t|
    t.integer "datos_actuale_id"
    t.integer "paciente_id"
    t.string  "respuesta"
  end

  add_index "detalle_datos_actuales", ["datos_actuale_id"], name: "index_detalle_datos_actuales_on_datos_actuale_id", using: :btree
  add_index "detalle_datos_actuales", ["paciente_id"], name: "index_detalle_datos_actuales_on_paciente_id", using: :btree

  create_table "detalle_dificultads", force: :cascade do |t|
    t.integer "dificultad_significativa_id"
    t.integer "dificultad_id"
    t.string  "respuesta"
  end

  add_index "detalle_dificultads", ["dificultad_id"], name: "index_detalle_dificultads_on_dificultad_id", using: :btree
  add_index "detalle_dificultads", ["dificultad_significativa_id"], name: "index_detalle_dificultads_on_dificultad_significativa_id", using: :btree

  create_table "detalle_expresion_emocionals", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "expresion_emocional_id"
    t.string  "respuesta"
  end

  add_index "detalle_expresion_emocionals", ["expresion_emocional_id"], name: "index_detalle_expresion_emocionals_on_expresion_emocional_id", using: :btree
  add_index "detalle_expresion_emocionals", ["paciente_id"], name: "index_detalle_expresion_emocionals_on_paciente_id", using: :btree

  create_table "detalle_habitos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "habito_id"
    t.string  "respuesta"
  end

  add_index "detalle_habitos", ["habito_id"], name: "index_detalle_habitos_on_habito_id", using: :btree
  add_index "detalle_habitos", ["paciente_id"], name: "index_detalle_habitos_on_paciente_id", using: :btree

  create_table "detalle_higienes", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "higiene_id"
    t.string  "respuesta"
  end

  add_index "detalle_higienes", ["higiene_id"], name: "index_detalle_higienes_on_higiene_id", using: :btree
  add_index "detalle_higienes", ["paciente_id"], name: "index_detalle_higienes_on_paciente_id", using: :btree

  create_table "detalle_pasatiempos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "pasatiempo_id"
    t.string  "respuesta"
  end

  add_index "detalle_pasatiempos", ["paciente_id"], name: "index_detalle_pasatiempos_on_paciente_id", using: :btree
  add_index "detalle_pasatiempos", ["pasatiempo_id"], name: "index_detalle_pasatiempos_on_pasatiempo_id", using: :btree

  create_table "detalle_sentido_eticos", force: :cascade do |t|
    t.string  "respuesta"
    t.integer "paciente_id"
    t.integer "sentido_etico_id"
  end

  add_index "detalle_sentido_eticos", ["paciente_id"], name: "index_detalle_sentido_eticos_on_paciente_id", using: :btree
  add_index "detalle_sentido_eticos", ["sentido_etico_id"], name: "index_detalle_sentido_eticos_on_sentido_etico_id", using: :btree

  create_table "detalle_suennos", force: :cascade do |t|
    t.integer "paciente_id"
    t.integer "suenno_id"
    t.string  "respuesta"
  end

  add_index "detalle_suennos", ["paciente_id"], name: "index_detalle_suennos_on_paciente_id", using: :btree
  add_index "detalle_suennos", ["suenno_id"], name: "index_detalle_suennos_on_suenno_id", using: :btree

  create_table "dificultad_significativas", force: :cascade do |t|
    t.integer  "paciente_id"
    t.string   "observaciones"
    t.string   "descripcion"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "dificultads", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estado_animo_afectivos", force: :cascade do |t|
    t.boolean  "depresion"
    t.boolean  "elacion"
    t.boolean  "euforia"
    t.boolean  "suspicacia"
    t.boolean  "colera"
    t.boolean  "felicidad"
    t.boolean  "culpa"
    t.boolean  "miedo"
    t.boolean  "ansiedad"
    t.boolean  "panico"
    t.boolean  "calma"
    t.boolean  "hostilidad"
    t.boolean  "tristeza"
    t.boolean  "afliccion"
    t.string   "otro"
    t.string   "observaciones"
    t.string   "estadoAnimoAdecuado"
    t.string   "nivelIntensidadApropiado"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "expresion_emocionals", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "familiars", force: :cascade do |t|
    t.integer  "historia_familiar_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "parentesco"
    t.integer  "edad"
    t.string   "ocupacion"
    t.string   "observaciones"
    t.string   "gradoConsaguinidad"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "familiars", ["historia_familiar_id"], name: "index_familiars_on_historia_familiar_id", using: :btree

  create_table "habitos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "higienes", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historia_familiars", force: :cascade do |t|
    t.integer  "padre_id"
    t.integer  "madre_id"
    t.integer  "paciente_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "historia_familiars", ["madre_id"], name: "index_historia_familiars_on_madre_id", using: :btree
  add_index "historia_familiars", ["paciente_id"], name: "index_historia_familiars_on_paciente_id", using: :btree
  add_index "historia_familiars", ["padre_id"], name: "index_historia_familiars_on_padre_id", using: :btree

  create_table "lenguaje_cualitativos", force: :cascade do |t|
    t.boolean  "prolijidad"
    t.boolean  "autoRecerencia"
    t.boolean  "inconsecuencia"
    t.boolean  "incoherencia"
    t.boolean  "neologismo"
    t.boolean  "bulbuceo"
    t.boolean  "tartamudeo"
    t.string   "otro"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "lenguaje_cuantitativos", force: :cascade do |t|
    t.boolean  "hablaIncesante"
    t.string   "observacionHablaIncesante"
    t.boolean  "hablaAcorde"
    t.string   "observacionHablaAcorde"
    t.boolean  "hablaPoco"
    t.string   "observacionHablaPoco"
    t.string   "observacionesGenerales"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "madres", id: false, force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "lugarNacimiento"
    t.date     "fechaNacimiento"
    t.integer  "edad"
    t.string   "sexo"
    t.integer  "telefono"
    t.string   "direccion"
    t.string   "gradoEscolar"
    t.string   "ocupacion"
    t.string   "situacionLaboral"
    t.string   "observaciones"
    t.string   "estadoCivil"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orientacions", force: :cascade do |t|
    t.integer  "paciente_id"
    t.text     "alopsiquica"
    t.text     "autopsiquica"
    t.text     "memoria"
    t.text     "aprendizaje"
    t.text     "atencionConcentracion"
    t.text     "procesamientoInformacion"
    t.text     "inteligencia"
    t.text     "observaciones"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "orientacions", ["paciente_id"], name: "index_orientacions_on_paciente_id", using: :btree

  create_table "pacientes", primary_key: "cedula", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "lugarNacimiento"
    t.date     "fechaNacimiento"
    t.integer  "edad"
    t.string   "sexo"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "gradoEscolar"
    t.string   "repitiente"
    t.string   "suministradorDatos"
    t.string   "circunstanciaSignificativa"
    t.string   "observacionHabitos"
    t.string   "observacionesContenidoPensamiento"
    t.string   "institucionEscolar"
    t.integer  "historialFamiliarId"
    t.integer  "antecedenteMorbidoFamiliarId"
    t.integer  "antecedetesEconomicosId"
    t.integer  "areaSexualId"
    t.integer  "orientacionId"
    t.integer  "cuestionario_tipo_frustracion_id"
    t.integer  "cuestionario_impedimento_id"
    t.integer  "cuestionario_conflicto_id"
    t.integer  "cuestionario_demora_id"
    t.integer  "temperamento_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "padres", id: false, force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "cedula"
    t.string   "lugarNacimiento"
    t.date     "fechaNacimiento"
    t.integer  "edad"
    t.string   "sexo"
    t.integer  "telefono"
    t.string   "direccion"
    t.string   "gradoEscolar"
    t.string   "ocupacion"
    t.string   "situacionLaboral"
    t.string   "observaciones"
    t.string   "estadoCivil"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "pasatiempos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pensamientos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sentido_eticos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicio_basicos", force: :cascade do |t|
    t.boolean  "alcantarillado"
    t.boolean  "aguaPotable"
    t.boolean  "luz"
    t.boolean  "internet"
    t.boolean  "telefono"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "suennos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temperamentos", force: :cascade do |t|
    t.string   "paciente_id"
    t.boolean  "agresividad"
    t.boolean  "insensibilidad"
    t.boolean  "impulsividad"
    t.boolean  "irritabilidad"
    t.boolean  "melancolia"
    t.boolean  "susceptibilidad"
    t.boolean  "sexualidad"
    t.boolean  "introversion"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "terapia", force: :cascade do |t|
    t.string   "temperamento"
    t.string   "terapia"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tipo_propiedads", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_viviendas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "correo"
    t.string   "password_digest"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.integer  "rol"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  create_table "valoracions", force: :cascade do |t|
    t.integer  "conduncta_valoracion_id"
    t.integer  "aspecto_id"
    t.integer  "comportamiento_id"
    t.integer  "paciente_id"
    t.string   "motivo"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "valoracions", ["aspecto_id"], name: "index_valoracions_on_aspecto_id", using: :btree
  add_index "valoracions", ["comportamiento_id"], name: "index_valoracions_on_comportamiento_id", using: :btree
  add_index "valoracions", ["conduncta_valoracion_id"], name: "index_valoracions_on_conduncta_valoracion_id", using: :btree
  add_index "valoracions", ["paciente_id"], name: "index_valoracions_on_paciente_id", using: :btree

  create_table "viviendas", force: :cascade do |t|
    t.integer  "tipo_vivienda_id"
    t.integer  "tipo_propiedad_id"
    t.integer  "servivcio_basico_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "viviendas", ["servivcio_basico_id"], name: "index_viviendas_on_servivcio_basico_id", using: :btree
  add_index "viviendas", ["tipo_propiedad_id"], name: "index_viviendas_on_tipo_propiedad_id", using: :btree
  add_index "viviendas", ["tipo_vivienda_id"], name: "index_viviendas_on_tipo_vivienda_id", using: :btree

end
