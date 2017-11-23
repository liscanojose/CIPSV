class CuestionarioTipoFrustracionController < ApplicationController

	def index
  	#@cuestionario_tipo_frustracion=pacienteId
  	@pacientes=Paciente.all
	end

  def create
    @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.new(cuestionario_tipo_frustracion_params)
    if @cuestionario_tipo_frustracion.save
     CuestionarioTipoFrustracion.find(@cuestionario_tipo_frustracion.id).update_attribute(:paciente_id, @cuestionario_tipo_frustracion.cedula) 
     Paciente.find(@cuestionario_tipo_frustracion.cedula).update_attribute(:cuestionario_tipo_frustracion_id, @cuestionario_tipo_frustracion.id) 
      
      paciente = Paciente.find(@cuestionario_tipo_frustracion.cedula)
      flash[:notice] = "Cuestionario Tipo de Frustracion Registrado Exitosamente"
      redirect_to paciente_path(paciente)
    else
      flash[:warning] = "Ha ocurrido un error al registrar"
      render 'cuestionario_tipo_frustracion'
    end
  end


	#Metodo encargado de dar los resultados de la evaluacion
	def show

    @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.find(params[:id])
    @evaluacion1="" #FRUSTRACIÓN POR IMPEDIMENTO
	  if @cuestionario_tipo_frustracion.resp_A1>=3 and @cuestionario_tipo_frustracion.resp_A2=="SI" and @cuestionario_tipo_frustracion.resp_A3=="SI" and @cuestionario_tipo_frustracion.resp_A4=="NO" and @cuestionario_tipo_frustracion.resp_A5=="SI" and @cuestionario_tipo_frustracion.resp_A6!="g Ninguna"

	  	@evaluacion1="Usted sufre de una frustracion por impedimiento"
	  else
	  	@evaluacion1="no presenta frustracion por impedimiento"
	  end

	   @evaluacion2="" #FRUSTRACIÓN POR CONFLICTO
	  if @cuestionario_tipo_frustracion.resp_B1=="SI" and @cuestionario_tipo_frustracion.resp_B2=="SI" and @cuestionario_tipo_frustracion.resp_B3=="SI" and @cuestionario_tipo_frustracion.resp_B4=="SI"

	  	@evaluacion2="Usted sufre de una frustracion por conflicto"
	  else
	  	@evaluacion2="no presenta frustracion por conflicto"
	  end


	  @evaluacion3="" #FRUSTRACIÓN POR DEMORA
	  if @cuestionario_tipo_frustracion.resp_C1>=5 and @cuestionario_tipo_frustracion.resp_C2>=5 and @cuestionario_tipo_frustracion.resp_C3=="SI"

	  	@evaluacion3="Usted sufre de una frustracion por demora"
	  else
	  	@evaluacion3="no presenta frustracion por demora"
	  end
  end

	def edit

	  @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.find(params[:id])
	end

  def update

    
  @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.find(params[:id])
 
    if @cuestionario_tipo_frustracion.update(cuestionario_tipo_frustracion_params)
      redirect_to "/mostrarPacientes"
    else
      render 'edit'
    end
  end
	
	def mostrar_todos

		@cuestionario_tipo_frustracions =CuestionarioTipoFrustracion.all
	

	end





  def evaluacion

	@cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.find(params[:id])
    @evaluacion1="" #FRUSTRACIÓN POR IMPEDIMENTO
	  if @cuestionario_tipo_frustracion.resp_A1>=3 and @cuestionario_tipo_frustracion.resp_A2=="SI" and @cuestionario_tipo_frustracion.resp_A3=="SI" and @cuestionario_tipo_frustracion.resp_A4=="NO" and @cuestionario_tipo_frustracion.resp_A5=="SI" and @cuestionario_tipo_frustracion.resp_A6!="g Ninguna"

	  	@evaluacion1="Usted sufre de una frustracion por impedimiento"
	  else
	  	@evaluacion1="no presenta frustracion por impedimiento"
	  end

	   @evaluacion2="" #FRUSTRACIÓN POR CONFLICTO
	  if @cuestionario_tipo_frustracion.resp_B1=="SI" and @cuestionario_tipo_frustracion.resp_B2=="SI" and @cuestionario_tipo_frustracion.resp_B3=="SI" and @cuestionario_tipo_frustracion.resp_B4=="SI"

	  	@evaluacion2="Usted sufre de una frustracion por conflicto"
	  else
	  	@evaluacion2="no presenta frustracion por conflicto"
	  end


	  @evaluacion3="" #FRUSTRACIÓN POR DEMORA
	  if @cuestionario_tipo_frustracion.resp_C1>=5 and @cuestionario_tipo_frustracion.resp_C2>=5 and @cuestionario_tipo_frustracion.resp_C3=="SI"

	  	@evaluacion3="Usted sufre de una frustracion por demora"
	  else
	  	@evaluacion3="no presenta frustracion por demora"
	  end

  end



  private

  def cuestionario_tipo_frustracion_params
    params.require(:cuestionario_tipo_frustracion).permit(:id, :cedula,:resp_A1, :resp_A2, :resp_A3, :resp_A4, :resp_A5, :resp_A6,:resp_B1, :resp_B2, :resp_B3, :resp_B4,:resp_C1, :resp_C2, :resp_C3,:pacienteId)
  end
  


end




