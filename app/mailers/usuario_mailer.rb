class UsuarioMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mailer.account_activation.subject
  #
   def account_activation(usuario)
    @usuario = usuario
    mail to: usuario.correo, subject: "Activar Cuenta"
  end

   def password_reset(usuario)
    @usuario = usuario
    mail to: usuario.correo, subject: "Restablecer contraseña"
  end
end
