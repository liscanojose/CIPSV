class PasswordResetsController < ApplicationController
	before_action :get_usuario,   only: [:edit, :update]
  before_action :valid_usuario, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)
  	
  	def new
  	end

  def create
    @usuario = Usuario.find_by(correo: params[:password_reset][:correo].downcase)
    if @usuario
      @usuario.create_reset_digest
      @usuario.send_password_reset_correo
      flash[:notice] = "Correo enviado con instrucciones para reestablecer su clave"
      redirect_to '/inicio'
    else
      flash.now[:warning] = "Direccion de correo no encontrada"
      render '/resetPassword'
    end
  end

  def edit
     @usuario = Usuario.find_by(correo: params[:correo])
  end

  def update
     @usuario = Usuario.find_by(correo: params[:correo])
    if params[:usuario][:password].empty?
      @usuario.errors.add(:password, "No puede estar vacio")
      render 'edit'
    elsif @usuario.update_attributes(usuario_params)
      
      @usuario.update_attribute(:reset_digest, nil)
      flash[:notice] = "La contraseña ha sido reestablecida."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

   def usuario_params
      params.require(:usuario).permit(:password, :password_confirmation)
    end

    def get_usuario
      @usuario = Usuario.find_by(correo: params[:correo])
    end

    # Confirms a valid user.
    def valid_usuario
      unless (@usuario && @usuario.activated? &&
              @usuario.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

        # Checks expiration of reset token.
    def check_expiration
      if @usuario.password_reset_expired?
        flash[:warning] = "Peticion de reestablecimiento de clave expirada"
        redirect_to new_password_reset_url
      end
    end
end
