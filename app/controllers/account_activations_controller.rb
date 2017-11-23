class AccountActivationsController < ApplicationController

  def edit
    usuario = Usuario.find_by(correo: params[:correo])
    if usuario && !usuario.activated? && usuario.authenticated?(:activation, params[:id])
      usuario.activate
      session[:usuario_id] = usuario.id
      flash[:notice] = "Cuenta activada!"
      #redirect_to usuario
      redirect_to '/inicio'
    else
      flash[:warning] = "link de activacion invalido"
      redirect_to root_url
    end
  end

end
