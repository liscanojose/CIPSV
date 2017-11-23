class CuestionarioDemoraController < ApplicationController
  def index
    @pacientes=Paciente.all
  end
  def create
    @cuestionario_demora = CuestionarioDemora.new(cuestionario_demora_params)

    if @cuestionario_demora.save
      Paciente.find(@cuestionario_demora.paciente_id).update_attribute(:cuestionario_demora_id, @cuestionario_demora.id)
      #Cuestionario_demora.find(@cuestionario_demora.id).update_attribute(:paciente_id, @cuestionario_tipo_frustracion.cedula) 
      #Paciente.find(@cuestionario_demora.id).update_attribute(:cuestionario_demora_id, @cuestionario_demora.id) 
      evaluacion(@cuestionario_demora.id)
      paciente = Paciente.find(@cuestionario_demora.paciente_id)
      flash[:notice] = "Cuestionario Frustracion por Demora Registrado Exitosamente"
      redirect_to paciente_path(paciente)
    else
      flash[:warning] = "Ha ocurrido un error al registrar"
      render 'cuestionario_demora'
    end
  end

 

  # Evaluacion del test de temperamentos cuando hay frustracion por demora

  def evaluacion(cuestionario_demora_id)

    #FRUSTRACIÓN POR DEMORA
    agresividad = false; insensibilidad = false; impulsividad= false; irritabilidad= false; melancolia=false;
    susceptibilidad = false; sexualidad=false;  introversion = false;
    
    @cuestionario_demora = CuestionarioDemora.find(cuestionario_demora_id)
    if @cuestionario_demora.resp_I1=="SI" and @cuestionario_demora.resp_I2=="SI" and
        @cuestionario_demora.resp_I3=="SI" and @cuestionario_demora.resp_I4=="SI" and
        @cuestionario_demora.resp_I5=="SI" and @cuestionario_demora.resp_I6=="SI" and

        @evaluacion1="Usted presenta un temperamento de agresividad"
      agresividad=true;
    else
      @evaluacion1="No presenta un temperamento de agresividad"
    end
    if @cuestionario_demora.resp_J1=="NO" and @cuestionario_demora.resp_J2=="SI" and
        @cuestionario_demora.resp_J3=="NO" and @cuestionario_demora.resp_J4=="SI" and
        @cuestionario_demora.resp_J5=="NO" and @cuestionario_demora.resp_J6=="NO" and
        @cuestionario_demora.resp_J7=="SI" and @cuestionario_demora.resp_J8=="SI" and
        @cuestionario_demora.resp_J9=="NO" and

        @evaluacion2="Usted presenta un temperamento de insensibilidad"
      insensibilidad =true;
    else
      @evaluacion2="No presenta un temperamento de insensibilidad"
    end

    if @cuestionario_demora.resp_K1=="NO" and @cuestionario_demora.resp_K2=="SI" and
        @cuestionario_demora.resp_K3=="NO" and @cuestionario_demora.resp_K4=="SI" and
        @cuestionario_demora.resp_K5=="SI" and @cuestionario_demora.resp_K6=="SI" and
        @cuestionario_demora.resp_K7=="SI" and


        @evaluacion3="Usted presenta un temperamento de impulsividad"
      impulsividad=true;
    else
      @evaluacion3="No presenta un temperamento de impulsividad"
    end


    if @cuestionario_demora.resp_L1=="SI" and @cuestionario_demora.resp_L2=="SI" and
        @cuestionario_demora.resp_L3=="SI" and @cuestionario_demora.resp_L4=="SI" and
        @cuestionario_demora.resp_L5=="NO" and

        @evaluacion4="Usted presenta un temperamento de irritabilidad"
      irritabilidad=true
    else
      @evaluacion4="No presenta un temperamento de irritabilidad"
    end

    if @cuestionario_demora.resp_M1=="SI" and @cuestionario_demora.resp_M2=="SI" and
        @cuestionario_demora.resp_M3=="SI" and @cuestionario_demora.resp_M4=="SI" and
        @cuestionario_demora.resp_M5=="SI" and @cuestionario_demora.resp_M6=="SI" and
        @cuestionario_demora.resp_M7=="SI" and @cuestionario_demora.resp_M8=="SI" and
        @cuestionario_demora.resp_M9=="SI" and @cuestionario_demora.resp_M10=="SI"and
        @evaluacion5="Usted presenta un temperamento de melancolia"
      melancolia=true;
    else
      @evaluacion5="No presenta un temperamento de melancolia"
    end

    if @cuestionario_demora.resp_N1=="SI" and @cuestionario_demora.resp_N2=="SI" and
        @cuestionario_demora.resp_N3=="SI" and @cuestionario_demora.resp_N4=="SI" and
        @cuestionario_demora.resp_N5=="SI" and @cuestionario_demora.resp_N6=="SI" and
        @cuestionario_demora.resp_N7=="SI" and @cuestionario_demora.resp_N8=="NO" and


        @evaluacion6="Usted presenta un temperamento de susceptibilidad"
      susceptibilidad=true;

    else
      @evaluacion6="No presenta un temperamento de susceptibilidad"
    end

    if @cuestionario_demora.resp_O1=="SI" and @cuestionario_demora.resp_O2=="SI" and
        @cuestionario_demora.resp_O3=="SI" and @cuestionario_demora.resp_O4=="NO" and
        @cuestionario_demora.resp_O5=="SI" and @cuestionario_demora.resp_O6=="SI" and

        @evaluacion7="Usted presenta un temperamento de sexualidad"
      sexualidad=true;
    else
      @evaluacion7="no presenta un temperamento de sexualidad"
    end

    if @cuestionario_demora.resp_P1=="SI" and @cuestionario_demora.resp_P2=="NO" and
        @cuestionario_demora.resp_P3=="NO" and @cuestionario_demora.resp_P4=="NO" and
        @cuestionario_demora.resp_P5=="SI" and @cuestionario_demora.resp_P6=="SI" and


        @evaluacion8="Usted presenta un temperamento de introversion"
      introversion=true;
    else
      @evaluacion8="no presenta un temperamento de introversion"
    end

    # Se guarda o actualiza el temperamento del paciente

    @paciente = Paciente.find(@cuestionario_demora.paciente_id)
    if @paciente.temperamento_id!=nil
      id= @paciente.temperamento_id;
      @temperamento = Temperamento.find(id)
      if
      agresividad==true
        @Temperamento.find(id).update_attribute(:agresividad,agresividad)
      end
      if
      insensibilidad==true
        Temperamento.find(id).update_attribute(:insensibilidad,insensibilidad)
      end
      if
      impulsividad==true
        Temperamento.find(id).update_attribute(:impulsividad,impulsividad)
      end
      if
      irritabilidad==true
        Temperamento.find(id).update_attribute(:irritabilidad,impulsividad)
      end
      if
      melancolia==true
        Temperamento.find(id).update_attribute(:melancolia,melancolia)
      end
      if
      susceptibilidad==true
        Temperamento.find(id).update_attribute(:susceptibilidad,susceptibilidad)
      end
      if
      sexualidad==true
        Temperamento.find(id).update_attribute(:sexualidad,sexualidad)
      end
      if
      introversion==true
        Temperamento.find(id).update_attribute(:introversion,introversion)
      end
    else
      @temperamento = Temperamento.new
      @temperamento.agresividad= agresividad
      @temperamento.impulsividad = impulsividad
      @temperamento.irritabilidad = irritabilidad
      @temperamento.susceptibilidad = susceptibilidad
      @temperamento.introversion= introversion
      @temperamento.sexualidad= sexualidad
      @temperamento.insensibilidad= insensibilidad
      @temperamento.melancolia = melancolia
      @temperamento.paciente_id = @cuestionario_demora.paciente_id
      @temperamento.save()
      Paciente.find(@cuestionario_demora.paciente_id).update_attribute(:temperamento_id, @temperamento.id)
    end
  end



 def edit
    @cuestionario_demora = CuestionarioDemora.find(params[:id])
  end

  def mostrar_todas_demoras
    @cuestionario_demora = CuestionarioDemora.all


  end
  def cuestionario_demora_params

    params.require(:cuestionario_demora).permit(:id, :paciente_id, :resp_I1, :resp_I2,
                                                :resp_I3, :resp_I4, :resp_I5, :resp_I6, :resp_J1, :resp_J2, :resp_J3,
                                                :resp_J4, :resp_J5, :resp_J6, :resp_J7, :resp_J8, :resp_J9, :resp_K1, :resp_K2, :resp_K3, :resp_K4,
                                                :resp_K5, :resp_K6, :resp_K7, :resp_L1, :resp_L2, :resp_L3, :resp_L4, :resp_L5,
                                                :resp_M1, :resp_M2, :resp_M3, :resp_M4, :resp_M5, :resp_M6, :resp_M7, :resp_M8, :resp_M9, :resp_M10, :resp_N1,
                                                :resp_N2, :resp_N3, :resp_N4, :resp_N5, :resp_N6, :resp_N7, :resp_N8, :resp_O1, :resp_O2,
                                                :resp_O3, :resp_O4, :resp_O5, :resp_O6, :resp_P1, :resp_P2, :resp_P3, :resp_P4, :resp_P5, :resp_P6,
                                                :pacienteId)
  end

end

