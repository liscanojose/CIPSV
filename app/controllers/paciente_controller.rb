class PacienteController < ApplicationController
  before_filter :authorize
  
  def index
    show = false
    case session[:rol_menu]
      when 0
        show = true
      when 1
        show = true
      when 2
        show = true
      when 3
        show = true
      when 4
        show = false
    end

    if show == false
      flash[:warning] = "No posee permisos para acceder a esta seccion"
        redirect_to(:controller => "dashboard")
    end
    @accionUsuario = "Paciente"
  end


  def show
    @paciente = Paciente.find(params[:id])
    @accionUsuario = "Paciente"


    #********************************************************* Tipo de Frustracion
    idTipoFrustracion = @paciente.cuestionario_tipo_frustracion_id

    if idTipoFrustracion != nil
      tipoFrustracion(idTipoFrustracion)

      @bool1 = @frustacionesBool[0]
      @bool2 = @frustacionesBool[1]
      @bool3 = @frustacionesBool[2]

    else
      @bool1 = false
      @bool2 = false
      @bool3 = false
    end

  end
    
#*********************************************************************************************************************
  def mostrarPerfilamiento

    @paciente = Paciente.find(params[:id])
    @accionUsuario = "Paciente"

    #********************************************************* Tipo de Frustracion
    idTipoFrustracion = @paciente.cuestionario_tipo_frustracion_id

    if idTipoFrustracion != nil
      tipoFrustracion(idTipoFrustracion)

      @tipoFrustracion1 = @frustaciones[0]
      @tipoFrustracion2 = @frustaciones[1]
      @tipoFrustracion3 = @frustaciones[2]

      dia = @cuestionario_tipo_frustracion.created_at.day.to_s
      mes = @cuestionario_tipo_frustracion.created_at.mon.to_s
      anio = @cuestionario_tipo_frustracion.created_at.year.to_s
      @fechatipoFrustracion =  ""
      @fechatipoFrustracion =  dia +"/"+ mes +"/"+ anio
    else
      flash[:warning] = "No se ha Realizado El Cuestionario Tipo de Frustracion"
      #redirect_to paciente_path(@paciente)
    end


    #********************************************************* Frustracion por Impedimento
    if @paciente.cuestionario_impedimento_id != nil
      cuestionario_impedimento_id = @paciente.cuestionario_impedimento_id
      frustracionImpedimento(cuestionario_impedimento_id)

      @impedimento1 = @impedimentos[0]
      @impedimento2 = @impedimentos[1]
      @impedimento3 = @impedimentos[2]
      @impedimento4 = @impedimentos[3]
      @impedimento5 = @impedimentos[4]
      @impedimento6 = @impedimentos[5]
      @impedimento7 = @impedimentos[6]
      @impedimento8 = @impedimentos[7]
    end

    #********************************************************* Frustracion por Demora
    if @paciente.cuestionario_demora_id != nil
      cuestionario_demora_id = @paciente.cuestionario_demora_id
      frustracionDemora(cuestionario_demora_id)

      @demora1  = @demoras[0]
      @demora2  = @demoras[1]
      @demora3  = @demoras[2]
      @demora4  = @demoras[3]
      @demora5  = @demoras[4]
      @demora6  = @demoras[5]
      @demora7  = @demoras[6]
      @demora8  = @demoras[7]
    end

      #********************************************************* Frustracion por Conflicto
    if @paciente.cuestionario_conflicto_id != nil
      cuestionario_conflicto_id = @paciente.cuestionario_conflicto_id
      frustracionConflicto(cuestionario_conflicto_id)

      @conflicto1  = @conflictos[0]
      @conflicto2  = @conflictos[1]
      @conflicto3  = @conflictos[2]
      @conflicto4  = @conflictos[3]
      @conflicto5  = @conflictos[4]
      @conflicto6  = @conflictos[5]
      @conflicto7  = @conflictos[6]
      @conflicto8  = @conflictos[7]
    end

    #********************************************************* Terapia

      @terapias = Array.new

      id= @paciente.temperamento_id;
      if id != nil
        @temperamento = Temperamento.find(id)
        if
        @temperamento.agresividad==true
          @terapiaAgresividad = Terapium.new
          @terapiaAgresividad.temperamento = 'Agresividad'
          @terapiaAgresividad.terapia= 'Se debe encauzar el carácter de confianza y autonomía y desarrollar en el individuo las aptitudes  artísticas, atléticas, manual. Todo ello se realizara por medio de terapias  de grupo ocupacional.'
          @terapias.push(@terapiaAgresividad)
        end
        if @temperamento.insensibilidad==true
        @terapiaInsensibilidad = Terapium.new
          @terapiaInsensibilidad.temperamento = 'Insensibilidad'
          @terapiaInsensibilidad.terapia= 'Se debe encauzar el carácter de  confianza, identidad integral, compromiso y generatividad y desarrollar en el individuo las aptitudes  artística, intelectual, sensorial, social. Todo ello se realizara por medio de terapias de confrontación, de grupo, maratón, familiar y recreativa. '
           @terapias.push(@terapiaInsensibilidad)
        end
        if
        @temperamento.impulsividad==true
          @terapiaImpulsividad = Terapium.new
          @terapiaImpulsividad.temperamento = "Impulsividad"
          @terapiaImpulsividad.terapia='Se debe encauzar el carácter de confianza y autonomía Todo ello se realizara por medio de terapias  de grupo, confrontación, familiar, recreativa y ocupacional.'
          @terapias.push(@terapiaImpulsividad)
        end
        if
        @temperamento.irritabilidad==true
          @terapiaIrritabilidad = Terapium.new
          @terapiaIrritabilidad.temperamento = "Irritabilidad"
          @terapiaIrritabilidad.terapia= 'Se debe encauzar el carácter de confianza y autonomía y desarrollar en el individuo las aptitudes  atlética, intelectual, manual, social, verbal. Todo ello se realizara por medio de terapias de grupo, confrontación, psicoterapia  y ocupacional.'
          @terapias.push(@terapiaIrritabilidad)
        end
        if
        @temperamento.melancolia==true
          @terapiaMelancolia = Terapium.new
          @terapiaMelancolia.temperamento = "Melancolia"
          @terapiaMelancolia.terapia= 'Se debe encauzar el carácter de confianza, identidad integral, trascendencia y desarrollar en el individuo las aptitudes  artística, manual,  social. Todo ello se realizara por medio de psicoterapia, terapia  ocupacional, recreativa, dinámicas de grupo, familiar.'
          @terapias.push(@terapiaMelancolia)
        end
        if
        @temperamento.susceptibilidad==true
          @terapiaSusceptibilidad = Terapium.new
          @terapiaSusceptibilidad.temperamento = "Susceptibilidad"
          @terapiaSusceptibilidad.terapia= 'Se debe encauzar el carácter de confianza, autonomía  y desarrollar en el individuo las aptitudes  artística, manual,  social, verbal. Todo ello se realizara por medio de psicoterapia, espiritualidad, meditación, confrontación e individualidad.'
          @terapias.push(@terapiaSusceptibilidad)
        end
        if
        @temperamento.sexualidad==true
          @terapiaSexualidad = Terapium.new
          @terapiaSexualidad.temperamento = "Sexualidadd"
          @terapiaSexualidad.terapia= 'Se debe encauzar el carácter de confianza, autonomía, identidad integral, trascendencia  y desarrollar en el individuo las aptitudes  atlética, sensorial, verbal. Todo ello se realizara por medio de terapias de grupo, urbanidad, deportes y recreación, ocupacional y psicoterapia.'
          @terapias.push(@terapiaSexualidad)
        end
        if
        @temperamento.introversion==true
          @terapiaIntroversion = Terapium.new
          @terapiaIntroversion.temperamento = "Introversion"
          @terapiaIntroversion.terapia= 'Se debe encauzar el carácter de confianza, autonomía, iniciativa, identidad integral, trascendencia  y desarrollar en el individuo las aptitudes  artística, social, verbal. Todo ello se realizara por medio de terapias de grupo, psicoterapia, ocupacional, familiar y recreativa.'
          @terapias.push @terapiaIntroversion
        end
      else
        @boolTerapias = false
      end        
  end


  def tipoFrustracion(idTipoFrustracion)

    @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.find(idTipoFrustracion)

      bool1 = nil
      bool2 = nil
      bool3 = nil

      @evaluacion1="" #FRUSTRACIÓN POR IMPEDIMENTO
      if @cuestionario_tipo_frustracion.resp_A1>=3 and @cuestionario_tipo_frustracion.resp_A2=="SI" and @cuestionario_tipo_frustracion.resp_A3=="SI" and @cuestionario_tipo_frustracion.resp_A4=="NO" and @cuestionario_tipo_frustracion.resp_A5=="SI" and @cuestionario_tipo_frustracion.resp_A6!="g Ninguna"
        bool1 = true
        @evaluacion1="Aplica"
      else
        bool1 = false
        @evaluacion1="No Aplica"
      end

       @evaluacion2="" #FRUSTRACIÓN POR CONFLICTO
      if @cuestionario_tipo_frustracion.resp_B1=="SI" and @cuestionario_tipo_frustracion.resp_B2=="SI" and @cuestionario_tipo_frustracion.resp_B3=="SI" and @cuestionario_tipo_frustracion.resp_B4=="SI"
        bool2 = true
        @evaluacion2="Aplica"
      else
        bool2 = false
        @evaluacion2="No Aplica"
      end


      @evaluacion3="" #FRUSTRACIÓN POR DEMORA
      if @cuestionario_tipo_frustracion.resp_C1>=5 and @cuestionario_tipo_frustracion.resp_C2>=5 and @cuestionario_tipo_frustracion.resp_C3=="SI"
        bool3 = true
        @evaluacion3="Aplica"
      else
        bool3 = false
        @evaluacion3="No Aplica"
      end

      @frustaciones = [@evaluacion1, @evaluacion2, @evaluacion3]
      @frustacionesBool = [bool1, bool2, bool3]
  end

  def frustracionImpedimento(cuestionario_impedimento_id)
    agresividad     = "No Aplica"
    insensibilidad  = "No Aplica"
    impulsividad    = "No Aplica"
    irritabilidad   = "No Aplica"
    melancolia      = "No Aplica"
    susceptibilidad = "No Aplica"
    sexualidad      = "No Aplica"
    introversion    = "No Aplica"



    @cuestionario_impedimento = CuestionarioImpedimento.find(cuestionario_impedimento_id)

    if @cuestionario_impedimento.resp_A1=="SI" and @cuestionario_impedimento.resp_A2=="SI" and
        @cuestionario_impedimento.resp_A3=="SI" and @cuestionario_impedimento.resp_A4=="SI" and
        @cuestionario_impedimento.resp_A5=="SI" and @cuestionario_impedimento.resp_A6=="SI" and
        @cuestionario_impedimento.resp_A7=="SI" and @cuestionario_impedimento.resp_A8=="SI"

      @evaluacion1="Usted presenta un temperamento de agresividad"
      agresividad="Aplica"
    else
      @evaluacion1="no presenta un temperamento de agresividad"
    end
    if @cuestionario_impedimento.resp_B1=="NO" and @cuestionario_impedimento.resp_B2=="SI" and
        @cuestionario_impedimento.resp_B3=="NO" and @cuestionario_impedimento.resp_B4=="SI" and
        @cuestionario_impedimento.resp_B5=="NO" and @cuestionario_impedimento.resp_B6=="NO" and
        @cuestionario_impedimento.resp_B7=="SI" and @cuestionario_impedimento.resp_B8=="SI" and
        @cuestionario_impedimento.resp_B9=="NO"

      @evaluacion2="Usted presenta un temperamento de insensibilidad"
      insensibilidad ="Aplica"
    else
      @evaluacion2="no presenta un temperamento de insensibilidad"
    end

    if @cuestionario_impedimento.resp_C1=="NO" and @cuestionario_impedimento.resp_C2=="SI" and
        @cuestionario_impedimento.resp_C3=="NO" and @cuestionario_impedimento.resp_C4=="SI" and
        @cuestionario_impedimento.resp_C5=="SI" and @cuestionario_impedimento.resp_C6=="SI" and


        @evaluacion3="Usted presenta un temperamento de impulsividad"
      impulsividad="Aplica"
    else
      @evaluacion3="no presenta un temperamento de impulsividad"
    end


    if @cuestionario_impedimento.resp_D1=="SI" and @cuestionario_impedimento.resp_D2=="SI" and
        @cuestionario_impedimento.resp_D3=="SI" and @cuestionario_impedimento.resp_D4=="SI" and
        @cuestionario_impedimento.resp_D5=="NO" and @cuestionario_impedimento.resp_D6=="SI" and
        @cuestionario_impedimento.resp_D7=="SI" and @cuestionario_impedimento.resp_D8=="SI" and


        @evaluacion4="Usted presenta un temperamento de irritabilidad"
      irritabilidad"Aplica"
    else
      @evaluacion4="no presenta un temperamento de irritabilidad"
    end

    if @cuestionario_impedimento.resp_E1=="SI" and @cuestionario_impedimento.resp_E2=="SI" and
        @cuestionario_impedimento.resp_E3=="SI" and @cuestionario_impedimento.resp_E4=="SI" and
        @cuestionario_impedimento.resp_E5=="SI" and @cuestionario_impedimento.resp_E6=="SI" and
        @cuestionario_impedimento.resp_E7=="SI" and @cuestionario_impedimento.resp_E8=="SI" and
        @cuestionario_impedimento.resp_E9=="SI"

      @evaluacion5="Usted presenta un temperamento de melancolia"
      melancolia="Aplica"
    else
      @evaluacion5="no presenta un temperamento de melancolia"
    end

    if @cuestionario_impedimento.resp_F1=="SI" and @cuestionario_impedimento.resp_F2=="SI" and
        @cuestionario_impedimento.resp_F3=="SI" and @cuestionario_impedimento.resp_F4=="SI" and
        @cuestionario_impedimento.resp_F5=="SI" and @cuestionario_impedimento.resp_F6=="SI" and
        @cuestionario_impedimento.resp_F7=="SI" and @cuestionario_impedimento.resp_F8=="SI" and
        @cuestionario_impedimento.resp_F9=="NO"

      @evaluacion6="Usted presenta un temperamento de susceptibilidad"
      susceptibilidad="Aplica"
    else
      @evaluacion6="no presenta un temperamento de susceptibilidad"
    end

    if @cuestionario_impedimento.resp_G1=="SI" and @cuestionario_impedimento.resp_G2=="SI" and
        @cuestionario_impedimento.resp_G3=="SI" and @cuestionario_impedimento.resp_G4=="NO" and
        @cuestionario_impedimento.resp_G5=="SI" and @cuestionario_impedimento.resp_G6=="SI" and
        @evaluacion7="Usted presenta un temperamento de sexualidad"
      sexualidad="Aplica"
    else
      @evaluacion7="no presenta un temperamento de sexualidad"
    end

    if @cuestionario_impedimento.resp_H1=="SI" and @cuestionario_impedimento.resp_H2=="NO" and
        @cuestionario_impedimento.resp_H3=="NO" and @cuestionario_impedimento.resp_H4=="NO" and
        @cuestionario_impedimento.resp_H5=="SI" and @cuestionario_impedimento.resp_H6=="SI" and


        @evaluacion8="Usted presenta un temperamento de introversion"
      introversion="Aplica"
    else
      @evaluacion8="no presenta un temperamento de introversion"
    end

    @impedimentos = [agresividad, insensibilidad, impulsividad, irritabilidad, melancolia, susceptibilidad, sexualidad, introversion]
  end

  def frustracionDemora(cuestionario_demora_id)
    agresividad     = "No Aplica"
    insensibilidad  = "No Aplica"
    impulsividad    = "No Aplica"
    irritabilidad   = "No Aplica"
    melancolia      = "No Aplica"
    susceptibilidad = "No Aplica"
    sexualidad      = "No Aplica"
    introversion    = "No Aplica"

    @cuestionario_demora = CuestionarioDemora.find(cuestionario_demora_id)

    if @cuestionario_demora.resp_I1=="SI" and @cuestionario_demora.resp_I2=="SI" and
      @cuestionario_demora.resp_I3=="SI" and @cuestionario_demora.resp_I4=="SI" and
      @cuestionario_demora.resp_I5=="SI" and @cuestionario_demora.resp_I6=="SI" and
      @evaluacion1="Usted presenta un temperamento de agresividad"
      agresividad="Aplica"
    else
      @evaluacion1="No presenta un temperamento de agresividad"
    end
    if @cuestionario_demora.resp_J1=="NO" and @cuestionario_demora.resp_J2=="SI" and
        @cuestionario_demora.resp_J3=="NO" and @cuestionario_demora.resp_J4=="SI" and
        @cuestionario_demora.resp_J5=="NO" and @cuestionario_demora.resp_J6=="NO" and
        @cuestionario_demora.resp_J7=="SI" and @cuestionario_demora.resp_J8=="SI" and
        @cuestionario_demora.resp_J9=="NO" and

        @evaluacion2="Usted presenta un temperamento de insensibilidad"
      insensibilidad ="Aplica"
    else
      @evaluacion2="No presenta un temperamento de insensibilidad"
    end

    if @cuestionario_demora.resp_K1=="NO" and @cuestionario_demora.resp_K2=="SI" and
        @cuestionario_demora.resp_K3=="NO" and @cuestionario_demora.resp_K4=="SI" and
        @cuestionario_demora.resp_K5=="SI" and @cuestionario_demora.resp_K6=="SI" and
        @cuestionario_demora.resp_K7=="SI" and


        @evaluacion3="Usted presenta un temperamento de impulsividad"
      impulsividad="Aplica"
    else
      @evaluacion3="No presenta un temperamento de impulsividad"
    end


    if @cuestionario_demora.resp_L1=="SI" and @cuestionario_demora.resp_L2=="SI" and
        @cuestionario_demora.resp_L3=="SI" and @cuestionario_demora.resp_L4=="SI" and
        @cuestionario_demora.resp_L5=="NO" and

        @evaluacion4="Usted presenta un temperamento de irritabilidad"
      irritabilidad="Aplica"
    else
      @evaluacion4="No presenta un temperamento de irritabilidad"
    end

    if @cuestionario_demora.resp_M1=="SI" and @cuestionario_demora.resp_M2=="SI" and
        @cuestionario_demora.resp_M3=="SI" and @cuestionario_demora.resp_M4=="SI" and
        @cuestionario_demora.resp_M5=="SI" and @cuestionario_demora.resp_M6=="SI" and
        @cuestionario_demora.resp_M7=="SI" and @cuestionario_demora.resp_M8=="SI" and
        @cuestionario_demora.resp_M9=="SI" and @cuestionario_demora.resp_M10=="SI"and
        @evaluacion5="Usted presenta un temperamento de melancolia"
      melancolia="Aplica"
    else
      @evaluacion5="No presenta un temperamento de melancolia"
    end

    if @cuestionario_demora.resp_N1=="SI" and @cuestionario_demora.resp_N2=="SI" and
        @cuestionario_demora.resp_N3=="SI" and @cuestionario_demora.resp_N4=="SI" and
        @cuestionario_demora.resp_N5=="SI" and @cuestionario_demora.resp_N6=="SI" and
        @cuestionario_demora.resp_N7=="SI" and @cuestionario_demora.resp_N8=="NO" and


        @evaluacion6="Usted presenta un temperamento de susceptibilidad"
      susceptibilidad="Aplica"

    else
      @evaluacion6="No presenta un temperamento de susceptibilidad"
    end

    if @cuestionario_demora.resp_O1=="SI" and @cuestionario_demora.resp_O2=="SI" and
        @cuestionario_demora.resp_O3=="SI" and @cuestionario_demora.resp_O4=="NO" and
        @cuestionario_demora.resp_O5=="SI" and @cuestionario_demora.resp_O6=="SI" and

        @evaluacion7="Usted presenta un temperamento de sexualidad"
      sexualidad="Aplica"
    else
      @evaluacion7="no presenta un temperamento de sexualidad"
    end

    if @cuestionario_demora.resp_P1=="SI" and @cuestionario_demora.resp_P2=="NO" and
        @cuestionario_demora.resp_P3=="NO" and @cuestionario_demora.resp_P4=="NO" and
        @cuestionario_demora.resp_P5=="SI" and @cuestionario_demora.resp_P6=="SI" and


        @evaluacion8="Usted presenta un temperamento de introversion"
      introversion="Aplica"
    else
      @evaluacion8="no presenta un temperamento de introversion"
    end


     @demoras = [agresividad, insensibilidad, impulsividad, irritabilidad, melancolia, susceptibilidad, sexualidad, introversion]
  end

  def frustracionConflicto(cuestionario_conflicto_id)

    agresividad     = "No Aplica"
    insensibilidad  = "No Aplica"
    impulsividad    = "No Aplica"
    irritabilidad   = "No Aplica"
    melancolia      = "No Aplica"
    susceptibilidad = "No Aplica"
    sexualidad      = "No Aplica"
    introversion    = "No Aplica"
    
    @cuestionario_conflicto = CuestionarioConflicto.find(cuestionario_conflicto_id)
    if @cuestionario_conflicto.resp_Q1=="SI" and @cuestionario_conflicto.resp_Q2=="SI" and
        @cuestionario_conflicto.resp_Q3=="SI" and @cuestionario_conflicto.resp_Q4=="SI" and
        @cuestionario_conflicto.resp_Q5=="SI" and @cuestionario_conflicto.resp_Q6=="SI" and
        @cuestionario_conflicto.resp_Q7=="SI" and @cuestionario_conflicto.resp_Q6=="SI" and
        @evaluacion1="Usted presenta un temperamento de agresividad"
      agresividad="Aplica"
    else
      @evaluacion1="No presenta un temperamento de agresividad"
    end
    if @cuestionario_conflicto.resp_R1=="NO" and @cuestionario_conflicto.resp_R2=="SI" and
        @cuestionario_conflicto.resp_R3=="NO" and @cuestionario_conflicto.resp_R4=="SI" and
        @cuestionario_conflicto.resp_R5=="NO" and @cuestionario_conflicto.resp_R6=="NO" and
        @cuestionario_conflicto.resp_R7=="SI" and @cuestionario_conflicto.resp_R8=="SI" and
        @cuestionario_conflicto.resp_R9=="SI" and@cuestionario_conflicto.resp_R10=="NO" and
        @evaluacion2="Usted presenta un temperamento de insensibilidad"
      insensibilidad ="Aplica"
    else
      @evaluacion2="No presenta un temperamento de insensibilidad"
    end

    if @cuestionario_conflicto.resp_S1=="NO" and @cuestionario_conflicto.resp_S2=="SI" and
        @cuestionario_conflicto.resp_S3=="NO" and @cuestionario_conflicto.resp_S4=="SI" and
        @cuestionario_conflicto.resp_S5=="SI" and @cuestionario_conflicto.resp_S6=="SI" and
        @cuestionario_conflicto.resp_S7=="SI" and
        @evaluacion3="Usted presenta un temperamento de impulsividad"
      impulsividad="Aplica"
    else
      @evaluacion3="No presenta un temperamento de impulsividad"
    end

    if @cuestionario_conflicto.resp_T1=="SI" and @cuestionario_conflicto.resp_T2=="SI" and
        @cuestionario_conflicto.resp_T3=="SI" and @cuestionario_conflicto.resp_T4=="SI" and
        @cuestionario_conflicto.resp_T5=="NO" and @cuestionario_conflicto.resp_T6=="SI" and

        @evaluacion4="Usted presenta un temperamento de irritabilidad"
      irritabilidad="Aplica"
    else
      @evaluacion4="No presenta un temperamento de irritabilidad"
    end

    if @cuestionario_conflicto.resp_U1=="SI" and @cuestionario_conflicto.resp_U2=="SI" and
        @cuestionario_conflicto.resp_U3=="SI" and @cuestionario_conflicto.resp_U4=="SI" and
        @cuestionario_conflicto.resp_U5=="SI" and @cuestionario_conflicto.resp_U6=="SI" and
        @cuestionario_conflicto.resp_U7=="SI" and @cuestionario_conflicto.resp_U8=="SI" and
        @cuestionario_conflicto.resp_U9=="SI" and
        @evaluacion5="Usted presenta un temperamento de melancolia"
      melancolia="Aplica"
    else
      @evaluacion5="No presenta un temperamento de melancolia"

    end

    if @cuestionario_conflicto.resp_V1=="SI" and @cuestionario_conflicto.resp_V2=="SI" and
        @cuestionario_conflicto.resp_V3=="SI" and @cuestionario_conflicto.resp_V4=="SI" and
        @cuestionario_conflicto.resp_V5=="SI" and @cuestionario_conflicto.resp_V6=="SI" and
        @cuestionario_conflicto.resp_V7=="SI" and @cuestionario_conflicto.resp_V8=="SI" and
        @cuestionario_conflicto.resp_V9=="SI" and @cuestionario_conflicto.resp_V10=="NO"and
        @evaluacion6="Usted presenta un temperamento de susceptibilidad"
      susceptibilidad="Aplica"
    else
      @evaluacion6="No presenta un temperamento de susceptibilidad"
    end

    if @cuestionario_conflicto.resp_W1=="SI" and @cuestionario_conflicto.resp_W2=="SI" and
        @cuestionario_conflicto.resp_W3=="SI" and @cuestionario_conflicto.resp_W4=="NO" and
        @cuestionario_conflicto.resp_W5=="SI" and @cuestionario_conflicto.resp_W6=="SI" and

        @evaluacion7="Usted presenta un temperamento de sexualidad"

      sexualidad="Aplica"
    else
      @evaluacion7="no presenta un temperamento de sexualidad"
    end

    if @cuestionario_conflicto.resp_X1=="SI" and @cuestionario_conflicto.resp_X2=="SI" and
        @cuestionario_conflicto.resp_X3=="NO" and @cuestionario_conflicto.resp_X4=="NO" and
        @cuestionario_conflicto.resp_X5=="NO" and @cuestionario_conflicto.resp_X6=="SI" and
        @cuestionario_conflicto.resp_X7=="SI" and
        @evaluacion8="Usted presenta un temperamento de introversion"
      introversion="Aplica"
    else
      @evaluacion8="no presenta un temperamento de introversion"
    end

     @conflictos = [agresividad, insensibilidad, impulsividad, irritabilidad, melancolia, susceptibilidad, sexualidad, introversion]

  end


#***********************    Frustraciones por Impedimento  *****************************************************






#****************************************************************************************************************************************************

  def createPaciente
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      flash[:notice] = "Paciente Registrado Exitosamente"
      redirect_to '/registrarPaciente'# ojo esto esta de forma provisional
    else
      flash[:warning] = "Ha Ocurrido Un Error"
      redirect_to '/registrarPaciente'# ojo esto esta de forma provisional
    end

  end

  def mostrar_pacientes
    @pacientes = Paciente.all
    @accionUsuario = "Paciente"
  end



  # Realiza cuestionario de frustraciones
  def realizar_cuestionario
    @paciente = Paciente.find(params[:id])
    @accionPerfilamiento = "Cuestionario Tipo Frustraciones"
  end

  # Realiza cuestionario de temperamento para pacientes con frustracion de tipo IMPEDIMENTO

  def realizar_cuestionario_impedimento
    @paciente = Paciente.find(params[:id])
    @accionPerfilamiento = "Cuestionario por Impedimento"
  end

# Realiza cuestionario de temperamento para pacientes con frustracion de tipo DEMORA

  def realizar_cuestionario_demora
    @paciente = Paciente.find(params[:id])
    @accionPerfilamiento = "Cuestionario por Demora"
  end


# Realiza cuestionario de temperamento para pacientes con frustracion de tipo CONFLICTO
  def realizar_cuestionario_conflicto
    @paciente = Paciente.find(params[:id])
    @accionPerfilamiento = "Cuestionario por Conflicto"
  end

  # Muestra las frustraciones de un paciente

  def mostrar_frustraciones
    @posts = Paciente.find(params[:id]).cuestionario_tipo_frustracions
  end

  # Muestra los temperamentos resultado del test para frustracion por impedimento

  def mostrar_impedimentos
    @impedimentos = Paciente.find(params[:id]).cuestionario_impedimentos
  end

# Muestra los temperamentos resultado del test para frustracion por demora

  def mostrar_demoras
    @demoras= Paciente.find(params[:id]).cuestionario_demoras
  end

# Muestra los temperamentos resultado del test para frustracion por conflicto

  def mostrar_conflictos
    @conflictos= Paciente.find(params[:id]).cuestionario_conflictos
  end

  private

  def paciente_params
    params.require(:paciente).permit(:nombres, :apellidos,:cedula, :fechaNacimiento, :edad, :sexo, :direccion, :telefono)#,  :cuestionarioTipoFrustracionId)
  end






#****************************************************************************************************************************************************************************


  def padre_params
    params.require(:padre).permit(:id, :nombres, :apellidos,:cedula, :lugarNacimiento,:fechaNacimiento, :edad, :sexo, :telefono,:direccion, :gradoEscolar, :ocupacion,:situacionLaboral,:estadoCivil,:observaciones)
  end

  def madre_params
    params.require(:madre).permit(:id, :nombres, :apellidos,:cedula, :lugarNacimiento,:fechaNacimiento, :edad, :sexo, :telefono,:direccion, :gradoEscolar, :ocupacion,:situacionLaboral,:estadoCivil,:observaciones)
  end

  def familiar_params
    params.require(:familiar).permit(:id,:nombre, :apellido,:parentesco,  :edad, :ocupacion,:gradoConsaguinidad, :observaciones)
  end


  def cuestionario_tipo_frustracion_params
    params.require(:cuestionario_tipo_frustracion).permit(:id, :cedula,:resp_A1, :resp_A2, :resp_A3, :resp_A4, :resp_A5, :resp_A6,:resp_B1, :resp_B2, :resp_B3, :resp_B4,:resp_C1, :resp_C2, :resp_C3,:pacienteId)
  end


  def create_cuestionario
    @cuestionario_tipo_frustracion = Cuestionario_tipo_frustracion.new(cuestionario_tipo_frustracion_params)

    if @cuestionario_tipo_frustracion.save
      flash[:notice] = "Cuestionario registrado exitosamente"
      redirect_to '/mostrarPacientes'
    else
      flash[:warning] = "Ha ocurrido algun error"
      render 'cuestionario_tipo_frustracion'
    end
  end



       # edit para actualizar el cuestionario
        def edit
          @paciente = Paciente.find(params[:id])
        end
        
      #**************************************************************************************
        def createPadre
          @padre = Padre.new(padre_params)

          if @padre.save
            flash[:notice] = "Padre registrado exitosamente"
            redirect_to '/paciente'# ojo esto esta de forma provisional
          else
        render #'new'
            redirect_to '/paciente'# ojo esto esta de forma provisional
          end
        end


        def createMadre
          @madre = Madre.new(madre_params)

          if @madre.save
            flash[:notice] = "Madre registrada exitosamente"
            redirect_to '/paciente'# ojo esto esta de forma provisional
          else
        render #'new'
            redirect_to '/paciente'# ojo esto esta de forma provisional
          end
        end


        def createFamiliar
          @familiar = Familiar.new(familiar_params)

          if @familiar.save
            flash[:notice] = "familiar registrado exitosamente"
            redirect_to '/paciente'# ojo esto esta de forma provisional
          else
        render #'new'
            redirect_to '/paciente'# ojo esto esta de forma provisional
          end
        end




end






     