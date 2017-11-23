class  UsuariosController < ApplicationController
	before_filter :authorize

#**************************************************************************************

	def registrarCoordinadorG
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = false
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

		if show == false
			flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		@usuario = Usuario.new
      		@accionUsuario = "Coordinador General"
   		end
	end


    def mostrarCoordinadorG
    	show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = false
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

    	if show == false
    		flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		#rol 1 => Coordinador General
      		@accionUsuario = "Coordinador General"
      		@usuario = Usuario.where("rol = 1")
   		end
	end

#**************************************************************************************
	def registrarPsicologo
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

		if show == false
			flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		@usuario = Usuario.new
      		@accionUsuario = "Psicologo"
   		end
	end


    def mostrarPsicologos
		#rol 2 => Psicologo
	    show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

		if show == false
    		flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		#rol 1 => Coordinador General
      		@accionUsuario = "Psicologo"
      		@usuario = Usuario.where("rol = 2")
   		end
	end
    
#**************************************************************************************
	def registrarPsiquiatra
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

		if show == false
			flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		@usuario = Usuario.new
      		@accionUsuario = "Psiquiatra"
   		end
	end

	def mostrarPsiquiatras
		#rol 3 => Psiquiatra
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end


    	if show == false
    		flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		#rol 1 => Coordinador General
      		@accionUsuario = "Psiquiatra"
      		@usuario = Usuario.where("rol = 3")
   		end
	end

#**************************************************************************************
	def registrarColaborador
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end

		if show == false
			flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		@usuario = Usuario.new
      		@accionUsuario = "Colaborador"

   		end
	end

	def mostrarColaboradores
		#rol 4 => Colaborador
		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = true
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end


    	if show == false
    		flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
      		#rol 1 => Coordinador General
      		@accionUsuario = "Colaborador"
      		@usuario = Usuario.where("rol = 4")
   		end

	end
#**************************************************************************************

    def create
		@usuario = Usuario.new(usuario_params)

		#Coordianador General
		if @usuario.rol == 1
			if @usuario.save
				@usuario.send_activation_correo
				flash[:notice] = "Correo de activacion enviado al correo."
				redirect_to "/mostrarCoordinadorGeneral"
			else
				flash[:warning] = "Ha ocurrido un problema"
				redirect_to "/registrarCoordinadorGeneral"
			end
		end

		#Psicologo
		if @usuario.rol == 2
			if @usuario.save
				@usuario.send_activation_correo
				flash[:notice] = "Correo de activacion enviado al correo."
				redirect_to "/mostrarPsicologos"
			else
				flash[:warning] = "Ha ocurrido un problema"
				redirect_to "/registrarPsicologo"
			end
		end

		#psiquiatra
		if @usuario.rol == 3
			if @usuario.save
				@usuario.send_activation_correo
				flash[:notice] = "Correo de activacion enviado al correo."
				redirect_to "/mostrarPsiquiatra"
			else
				flash[:warning] = "Ha ocurrido un problema"
				redirect_to "/registrarPsiquiatras"
			end
		end

		#Colaborador
		if @usuario.rol == 4
			if @usuario.save
				@usuario.send_activation_correo
				flash[:notice] = "Correo de activacion enviado al correo."
				redirect_to "/mostrarColaborador"
			else
				flash[:warning] = "Ha ocurrido un problema"
				redirect_to "/registrarColaboradores"
			end
		end

				

    end


	def show
		@usuario = Usuario.find(params[:id])

		case @usuario.rol
	      when 0
	        @accionUsuario = "Presidente"
	      when 1
	        @accionUsuario = "Coordinador General"
	      when 2
	        @accionUsuario = "Psicologo"
	      when 3
	        @accionUsuario = "Psiquiatra"
	      when 4
	        @accionUsuario = "Colaborador"
	    end
	end

	def edit
		@usuario = Usuario.find(params[:id])

		case @usuario.rol
	      when 0
	        @accionUsuario = "Presidente"
	      when 1
	        @accionUsuario = "Coordinador General"
	      when 2
	        @accionUsuario = "Psicologo"
	      when 3
	        @accionUsuario = "Psiquiatra"
	      when 4
	        @accionUsuario = "Colaborador"
	    end
	end

	def update
  		@usuario = Usuario.find(params[:id])
 
    	if @usuario.update(usuario_params)
    		flash[:notice] = "Usuario Actualizado"
      		redirect_to usuario_path(@usuario)#@usuario
      		#render 'mostrarCoordinadorG'
    	else
      		render 'edit'
    	end
  	end


  	def destroy
  		show = false
		case session[:rol_menu]
	      when 0
	        show = true
	      when 1
	        show = false
	      when 2
	        show = false
	      when 3
	        show = false
	      when 4
	        show = false
	    end


    	if show == false
    		flash[:warning] = "No posee permisos para acceder a esta seccion"
      		redirect_to(:controller => "dashboard")
      	else
		  if  Usuario.find(params[:id]).id==session[:usuario_id]
		    Usuario.find(params[:id]).destroy
		    flash[:success] = "Usuario borrado"
		    session[:usuario_id] = nil
		    redirect_to '/login'
		  else
		    Usuario.find(params[:id]).destroy
		    flash[:success] = "Usuario borrado"
		    redirect_to usuarios_url
		    #redirect_to 'usuarios/index' ojo si uso url se autorefresca la pagina y no da error buscando el id q se acaba de borrar si lo usara con usuarios/index daria error
		  end
	  end
	end

#**************************************************************************************


#**************************************************************************************
	private

	def usuario_params
		params.require(:usuario).permit(:id, :nombre, :apellido, :telefono, :correo, :rol, :password, :password_confirmation)
	end


end