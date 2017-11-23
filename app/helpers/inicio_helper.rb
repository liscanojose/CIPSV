module InicioHelper
	
	def forget(usuario)
    	usuario.forget
    	cookies.delete(:usuario_id)
    	cookies.delete(:remember_token)
  	end

end
