class SesionController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    
  end

  def create
    usuario = Usuario.find_by_correo(params[:correo])
    # if the user exists AND the password entered is correct
    if usuario && usuario.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      if usuario.activated?
        session[:usuario_id] = usuario.id
        session[:usuario_nombre] = usuario.nombre
        session[:usuario_apellido] = usuario.apellido
        session[:logueado] = true;

        #variable para controlar la interfaz del menu a mostrarse por rol
        session[:rol_menu] = usuario.rol

        case usuario.rol
        when 0
          session[:usuario_rol] = "Presidente"
        when 1
          session[:usuario_rol] = "Coordinador General"
        when 2
          session[:usuario_rol] = "Psicologo"
        when 3
          session[:usuario_rol] = "Psiquiatra"
        when 4
          session[:usuario_rol] = "Colaborador"
        end

        flash[:notice] = "Bienvenido"
        redirect_to '/dashboard'
      else
        message  = "Cuenta no activada. "
        message += "Revisa tu correo y has click en el link de activacion de tu cuenta."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:warning] = "Datos introducidos incorrectos."
      redirect_to root_url
   end
  end

  def destroy
    session[:usuario_id] = nil
    session[:usuario_nombre] = nil
    session[:usuario_apellido] = nil
    session[:usuario_rol] = nil
    session[:rol_menu] = nil
    session[:logueado] = false

    flash[:notice] = "Te has desconectado exitosamente."
    redirect_to '/inicio'
  end
end

#Roles
#0     Presidente
#1     Coordinador general
#2     Psicologo
#3     Psiquiatra
#4     Colaborador