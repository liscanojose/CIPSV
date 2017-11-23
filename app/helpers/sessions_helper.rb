module SessionsHelper
	def forget(usuario)
    usuario.forget
    cookies.delete(:usuario_id)
    cookies.delete(:remember_token)
  	end

  	 # Returns the current logged-in user (if any).
  def current_usuario
    if (usuario_id = session[:usuario_id])
      @current_usuario ||= Usuario.find_by(id: usuario_id)
    elsif (usuario_id = cookies.signed[:usuario_id])
      usuario = Usuario.find_by(id: usuario_id)
      if usuario && usuario.authenticated?(:remember, cookies[:remember_token])
        #log_in usuario
        render 'inicio'
        @current_usuario = usuario
      end
    end
  end
end
