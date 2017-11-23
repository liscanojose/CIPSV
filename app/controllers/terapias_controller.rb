class TerapiasController < ApplicationController
  def terapia
  end

  def index
    @pacientes=Paciente.all
  end

  def mostrar_terapia
    @terapias = Array.new

    if Paciente.find(params[:id])
      @paciente = Paciente.find(params[:id])
      id= @paciente.temperamento_id;
      if id != nil
        @temperamento = Temperamento.find(id)
        if
        @temperamento.agresividad==true
          @terapiaAgresividad = Terapium.new
          @terapiaAgresividad.temperamento = 'Agresividad';
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
        flash[:warning] = "El Paciente no posee terapias asociadas"
      end        
    else
      flash[:warning] = "El Paciente no posee terapias asociadas"
    end

  end


end