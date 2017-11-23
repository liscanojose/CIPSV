
class CuestionarioConflictoController < ApplicationController
  
  def index
    @pacientes=Paciente.all
  end

  def create
    @cuestionario_conflicto = CuestionarioConflicto.new(cuestionario_conflicto_params)
    if @cuestionario_conflicto.save
      Paciente.find(@cuestionario_conflicto.paciente_id).update_attribute(:cuestionario_conflicto_id, @cuestionario_conflicto.id)
      #Cuestionario_conflicto.find(@cuestionario_conflicto.id).update_attribute(:paciente_id, @cuestionario_tipo_frustracion.cedula)
      #Paciente.find(@cuestionario_conflicto.id).update_attribute(:cuestionario_conflicto_id, @cuestionario_conflicto.id)
      evaluacion(@cuestionario_conflicto.id)
      paciente = Paciente.find(@cuestionario_conflicto.paciente_id)
      flash[:notice] = "Cuestionario Frustracion Por Conflicto Registrado Exitosamente"
      redirect_to paciente_path(paciente)
    else
      render 'cuestionario_conflicto'
      #redirect_to '/signup'
    end
  end

  # Evaluacion del test de temperamentos cuando hay frustracion por conflicto

  def evaluacion(cuestionario_conflicto_id)

    #FRUSTRACIÓN POR conflicto
    agresividad = false; insensibilidad = false; impulsividad= false; irritabilidad= false; melancolia=false;
    susceptibilidad = false; sexualidad=false;  introversion = false;

    @cuestionario_conflicto = CuestionarioConflicto.find(cuestionario_conflicto_id)
    if @cuestionario_conflicto.resp_Q1=="SI" and @cuestionario_conflicto.resp_Q2=="SI" and
        @cuestionario_conflicto.resp_Q3=="SI" and @cuestionario_conflicto.resp_Q4=="SI" and
        @cuestionario_conflicto.resp_Q5=="SI" and @cuestionario_conflicto.resp_Q6=="SI" and
        @cuestionario_conflicto.resp_Q7=="SI" and @cuestionario_conflicto.resp_Q6=="SI" and
        @evaluacion1="Usted presenta un temperamento de agresividad"
      agresividad=true;
    else
      @evaluacion1="No presenta un temperamento de agresividad"
    end
    if @cuestionario_conflicto.resp_R1=="NO" and @cuestionario_conflicto.resp_R2=="SI" and
        @cuestionario_conflicto.resp_R3=="NO" and @cuestionario_conflicto.resp_R4=="SI" and
        @cuestionario_conflicto.resp_R5=="NO" and @cuestionario_conflicto.resp_R6=="NO" and
        @cuestionario_conflicto.resp_R7=="SI" and @cuestionario_conflicto.resp_R8=="SI" and
        @cuestionario_conflicto.resp_R9=="SI" and@cuestionario_conflicto.resp_R10=="NO" and
        @evaluacion2="Usted presenta un temperamento de insensibilidad"
      insensibilidad =true;
    else
      @evaluacion2="No presenta un temperamento de insensibilidad"
    end

    if @cuestionario_conflicto.resp_S1=="NO" and @cuestionario_conflicto.resp_S2=="SI" and
        @cuestionario_conflicto.resp_S3=="NO" and @cuestionario_conflicto.resp_S4=="SI" and
        @cuestionario_conflicto.resp_S5=="SI" and @cuestionario_conflicto.resp_S6=="SI" and
        @cuestionario_conflicto.resp_S7=="SI" and
        @evaluacion3="Usted presenta un temperamento de impulsividad"
      impulsividad=true;
    else
      @evaluacion3="No presenta un temperamento de impulsividad"
    end

    if @cuestionario_conflicto.resp_T1=="SI" and @cuestionario_conflicto.resp_T2=="SI" and
        @cuestionario_conflicto.resp_T3=="SI" and @cuestionario_conflicto.resp_T4=="SI" and
        @cuestionario_conflicto.resp_T5=="NO" and @cuestionario_conflicto.resp_T6=="SI" and

        @evaluacion4="Usted presenta un temperamento de irritabilidad"
      irritabilidad=true;
    else
      @evaluacion4="No presenta un temperamento de irritabilidad"
    end

    if @cuestionario_conflicto.resp_U1=="SI" and @cuestionario_conflicto.resp_U2=="SI" and
        @cuestionario_conflicto.resp_U3=="SI" and @cuestionario_conflicto.resp_U4=="SI" and
        @cuestionario_conflicto.resp_U5=="SI" and @cuestionario_conflicto.resp_U6=="SI" and
        @cuestionario_conflicto.resp_U7=="SI" and @cuestionario_conflicto.resp_U8=="SI" and
        @cuestionario_conflicto.resp_U9=="SI" and
        @evaluacion5="Usted presenta un temperamento de melancolia"
      melancolia=true;
    else
      @evaluacion5="No presenta un temperamento de melancolia"

    end

    if @cuestionario_conflicto.resp_V1=="SI" and @cuestionario_conflicto.resp_V2=="SI" and
        @cuestionario_conflicto.resp_V3=="SI" and @cuestionario_conflicto.resp_V4=="SI" and
        @cuestionario_conflicto.resp_V5=="SI" and @cuestionario_conflicto.resp_V6=="SI" and
        @cuestionario_conflicto.resp_V7=="SI" and @cuestionario_conflicto.resp_V8=="SI" and
        @cuestionario_conflicto.resp_V9=="SI" and @cuestionario_conflicto.resp_V10=="NO"and
        @evaluacion6="Usted presenta un temperamento de susceptibilidad"
      susceptibilidad=true;
    else
      @evaluacion6="No presenta un temperamento de susceptibilidad"
    end

    if @cuestionario_conflicto.resp_W1=="SI" and @cuestionario_conflicto.resp_W2=="SI" and
        @cuestionario_conflicto.resp_W3=="SI" and @cuestionario_conflicto.resp_W4=="NO" and
        @cuestionario_conflicto.resp_W5=="SI" and @cuestionario_conflicto.resp_W6=="SI" and

        @evaluacion7="Usted presenta un temperamento de sexualidad"

      sexualidad=true;
    else
      @evaluacion7="no presenta un temperamento de sexualidad"
    end

    if @cuestionario_conflicto.resp_X1=="SI" and @cuestionario_conflicto.resp_X2=="SI" and
        @cuestionario_conflicto.resp_X3=="NO" and @cuestionario_conflicto.resp_X4=="NO" and
        @cuestionario_conflicto.resp_X5=="NO" and @cuestionario_conflicto.resp_X6=="SI" and
        @cuestionario_conflicto.resp_X7=="SI" and
        @evaluacion8="Usted presenta un temperamento de introversion"
      introversion=true;
    else
      @evaluacion8="no presenta un temperamento de introversion"
    end


    # Se guarda o actualiza el temperamento del paciente

    @paciente = Paciente.find(@cuestionario_conflicto.paciente_id)
    if @paciente.temperamento_id!=nil
      id= @paciente.temperamento_id;
      @temperamento = Temperamento.find(id)
      if
      agresividad==true
        Temperamento.find(id).update_attribute(:agresividad,agresividad)
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
      @temperamento.paciente_id = @cuestionario_conflicto.paciente_id
      @temperamento.save()
      Paciente.find(@cuestionario_conflicto.paciente_id).update_attribute(:temperamento_id, @temperamento.id)
    end

  end

  def edit
    @cuestionario_conflicto = CuestionarioConflicto.find(params[:id])
  end

  def mostrar_todas_conflictos
    @cuestionario_conflicto = CuestionarioConflicto.all
  end


  def cuestionario_conflicto_params

    params.require(:cuestionario_conflicto).permit(:id, :paciente_id, :resp_Q1, :resp_Q2,:resp_Q3, :resp_Q4, :resp_Q5, :resp_Q6, :resp_Q7, :resp_R1, :resp_R2, :resp_R3,:resp_R4, :resp_R5, :resp_R6, :resp_R7, :resp_R8, :resp_R9, :resp_R10, :resp_S1, :resp_S2, :resp_S3,:resp_S4, :resp_S5, :resp_S6, :resp_S7,:resp_T1, :resp_T2, :resp_T3, :resp_T4, :resp_T5, :resp_T6,:resp_U1, :resp_U2, :resp_U3, :resp_U4, :resp_U5, :resp_U6, :resp_U7, :resp_U8, :resp_U9, :resp_U10, :resp_V1,:resp_V2, :resp_V3, :resp_V4, :resp_V5, :resp_V6, :resp_V7, :resp_V8, :resp_V9, :resp_V10,:resp_W1, :resp_W2,:resp_W3, :resp_W4, :resp_W5, :resp_W6, :resp_X1, :resp_X2, :resp_X3, :resp_X4, :resp_X5, :resp_X6, :resp_X7,:pacienteId)
  end


end