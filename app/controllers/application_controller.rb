class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

 protect_from_forgery with: :exception

	def authorize

  		if session[:logueado] == false or session[:logueado] == nil
			flash[:warning] = "Por favor, Inicie Sesion"
			redirect_to(:controller => "inicio")
		end
	end

end