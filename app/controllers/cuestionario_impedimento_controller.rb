class CuestionarioImpedimentoController < ApplicationController
  def index
  	@pacientes=Paciente.all
  end

  def create
    @cuestionario_impedimento = CuestionarioImpedimento.new(cuestionario_impedimento_params)
    
    if @cuestionario_impedimento.save
    	 Paciente.find(@cuestionario_impedimento.paciente_id).update_attribute(:cuestionario_impedimento_id, @cuestionario_impedimento.id) 
     #Cuestionario_impedimento.find(@cuestionario_impedimento.id).update_attribute(:paciente_id, @cuestionario_tipo_frustracion.cedula) 
     #Paciente.find(@cuestionario_impedimento.id).update_attribute(:cuestionario_impedimento_id, @cuestionario_impedimento.id) 
      evaluacion(@cuestionario_impedimento.id)
     	paciente = Paciente.find(@cuestionario_impedimento.paciente_id)
      flash[:notice] = "Cuestionario Frustracion Por Impedimento Registrado Exitosamente"
      redirect_to paciente_path(paciente)
    else
  		render 'cuestionario_impedimento'
    end

	end

	# Evaluacion del test de temperamentos cuando hay frustracion por impedimentos

  def evaluacion(cuestionario_impedimento_id)

		#FRUSTRACIÓN POR IMPEDIMENTO
		agresividad = false; insensibilidad = false; impulsividad= false; irritabilidad= false; melancolia=false;
		susceptibilidad = false; sexualidad=false;  introversion = false;

		@cuestionario_impedimento = CuestionarioImpedimento.find(cuestionario_impedimento_id)
		if @cuestionario_impedimento.resp_A1=="SI" and @cuestionario_impedimento.resp_A2=="SI" and
				@cuestionario_impedimento.resp_A3=="SI" and @cuestionario_impedimento.resp_A4=="SI" and
				@cuestionario_impedimento.resp_A5=="SI" and @cuestionario_impedimento.resp_A6=="SI" and
				@cuestionario_impedimento.resp_A7=="SI" and @cuestionario_impedimento.resp_A8=="SI"

			@evaluacion1="Usted presenta un temperamento de agresividad"
			agresividad=true;
		else
			@evaluacion1="no presenta un temperamento de agresividad"
		end
		if @cuestionario_impedimento.resp_B1=="NO" and @cuestionario_impedimento.resp_B2=="SI" and
				@cuestionario_impedimento.resp_B3=="NO" and @cuestionario_impedimento.resp_B4=="SI" and
				@cuestionario_impedimento.resp_B5=="NO" and @cuestionario_impedimento.resp_B6=="NO" and
				@cuestionario_impedimento.resp_B7=="SI" and @cuestionario_impedimento.resp_B8=="SI" and
				@cuestionario_impedimento.resp_B9=="NO"

			@evaluacion2="Usted presenta un temperamento de insensibilidad"
			insensibilidad =true;
		else
			@evaluacion2="no presenta un temperamento de insensibilidad"
		end

		if @cuestionario_impedimento.resp_C1=="NO" and @cuestionario_impedimento.resp_C2=="SI" and
				@cuestionario_impedimento.resp_C3=="NO" and @cuestionario_impedimento.resp_C4=="SI" and
				@cuestionario_impedimento.resp_C5=="SI" and @cuestionario_impedimento.resp_C6=="SI" and


				@evaluacion3="Usted presenta un temperamento de impulsividad"
			impulsividad=true;
		else
			@evaluacion3="no presenta un temperamento de impulsividad"
		end


		if @cuestionario_impedimento.resp_D1=="SI" and @cuestionario_impedimento.resp_D2=="SI" and
				@cuestionario_impedimento.resp_D3=="SI" and @cuestionario_impedimento.resp_D4=="SI" and
				@cuestionario_impedimento.resp_D5=="NO" and @cuestionario_impedimento.resp_D6=="SI" and
				@cuestionario_impedimento.resp_D7=="SI" and @cuestionario_impedimento.resp_D8=="SI" and


				@evaluacion4="Usted presenta un temperamento de irritabilidad"
			irritabilidad=true
		else
			@evaluacion4="no presenta un temperamento de irritabilidad"
		end

		if @cuestionario_impedimento.resp_E1=="SI" and @cuestionario_impedimento.resp_E2=="SI" and
				@cuestionario_impedimento.resp_E3=="SI" and @cuestionario_impedimento.resp_E4=="SI" and
				@cuestionario_impedimento.resp_E5=="SI" and @cuestionario_impedimento.resp_E6=="SI" and
				@cuestionario_impedimento.resp_E7=="SI" and @cuestionario_impedimento.resp_E8=="SI" and
				@cuestionario_impedimento.resp_E9=="SI"

			@evaluacion5="Usted presenta un temperamento de melancolia"
			melancolia=true;
		else
			@evaluacion5="no presenta un temperamento de melancolia"
		end

		if @cuestionario_impedimento.resp_F1=="SI" and @cuestionario_impedimento.resp_F2=="SI" and
				@cuestionario_impedimento.resp_F3=="SI" and @cuestionario_impedimento.resp_F4=="SI" and
				@cuestionario_impedimento.resp_F5=="SI" and @cuestionario_impedimento.resp_F6=="SI" and
				@cuestionario_impedimento.resp_F7=="SI" and @cuestionario_impedimento.resp_F8=="SI" and
				@cuestionario_impedimento.resp_F9=="NO"

			@evaluacion6="Usted presenta un temperamento de susceptibilidad"
			susceptibilidad=true;
		else
			@evaluacion6="no presenta un temperamento de susceptibilidad"
		end

		if @cuestionario_impedimento.resp_G1=="SI" and @cuestionario_impedimento.resp_G2=="SI" and
				@cuestionario_impedimento.resp_G3=="SI" and @cuestionario_impedimento.resp_G4=="NO" and
				@cuestionario_impedimento.resp_G5=="SI" and @cuestionario_impedimento.resp_G6=="SI" and
				@evaluacion7="Usted presenta un temperamento de sexualidad"
			sexualidad=true;
		else
			@evaluacion7="no presenta un temperamento de sexualidad"
		end

		if @cuestionario_impedimento.resp_H1=="SI" and @cuestionario_impedimento.resp_H2=="NO" and
				@cuestionario_impedimento.resp_H3=="NO" and @cuestionario_impedimento.resp_H4=="NO" and
				@cuestionario_impedimento.resp_H5=="SI" and @cuestionario_impedimento.resp_H6=="SI" and


				@evaluacion8="Usted presenta un temperamento de introversion"
			introversion=true;
		else
			@evaluacion8="no presenta un temperamento de introversion"
		end

		# Se guarda o actualiza el temperamento del paciente
		@paciente = Paciente.find(@cuestionario_impedimento.paciente_id)
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
			@temperamento.paciente_id = @cuestionario_impedimento.paciente_id
			@temperamento.save()
			Paciente.find(@cuestionario_impedimento.paciente_id).update_attribute(:temperamento_id, @temperamento.id)
		end
	   
  end


  def cuestionario_impedimento_params

    params.require(:cuestionario_impedimento).permit(:id, :paciente_id,:resp_A1, :resp_A2,
     :resp_A3, :resp_A4, :resp_A5, :resp_A6,:resp_A7,:resp_A8,:resp_B1, :resp_B2, :resp_B3,
     :resp_B4,:resp_B5,:resp_B6,:resp_B7,:resp_B8,:resp_B9,:resp_C1, :resp_C2, :resp_C3,:resp_C4,
     :resp_C5,:resp_C6,:resp_D1,:resp_D2,:resp_D3,:resp_D4,:resp_D5,:resp_D6,:resp_D7,:resp_D8,
     :resp_E1,:resp_E2,:resp_E3,:resp_E4,:resp_E5,:resp_E6,:resp_E7,:resp_E8,:resp_E9,:resp_F1,
     :resp_F2,:resp_F3,:resp_F4,:resp_F5,:resp_F6,:resp_F7,:resp_F8,:resp_F9,:resp_G1,:resp_G2,
     :resp_G3,:resp_G4,:resp_G5,:resp_G6,:resp_H1,:resp_H2,:resp_H3,:resp_H4,:resp_H5,:resp_H6,
     :pacienteId)
  end

end
