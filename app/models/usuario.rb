class Usuario < ActiveRecord::Base
	  has_secure_password
	  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	  validates :correo, uniqueness: {case_sensitive: false ,message: "Este correo ya fue registrado"}
	  attr_accessor :remember_token, :activation_token, :reset_token
  	  before_save   :downcase_correo
  	  before_create :create_activation_digest
  	  validates :nombre,  presence: true, length: { in: 2..30 }
  	  validates :apellido,  presence: true, length: { in: 2..30 }
  	  validates :password, length: { in: 8..20 }
  	  validates :correo, presence: true, format: { with: VALID_EMAIL_REGEX }
  	  validates :rol, presence: true



  	  # Returns true if the given token matches the digest.
	  def authenticated?(attribute, token)
	    digest = send("#{attribute}_digest")
	    return false if digest.nil?
	    BCrypt::Password.new(digest).is_password?(token)
	  end


	  def Usuario.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
  	  end


	  # Returns a random token.
	  def Usuario.new_token
	    SecureRandom.urlsafe_base64
	  end

	  # Remembers a user in the database for use in persistent sessions.
	  def remember
	    self.remember_token = Usuario.new_token
	    update_attribute(:remember_digest, Usuario.digest(remember_token))
	  end

	  	
		# Activates an account.
  	  def activate
	    update_attribute(:activated,    true)
	    update_attribute(:activated_at, Time.zone.now)
      end

	  # Sends activation email.
	  def send_activation_correo
	    UsuarioMailer.account_activation(self).deliver_now
	  end

		  # Sets the password reset attributes.
	  def create_reset_digest
	    self.reset_token = Usuario.new_token
	    update_attribute(:reset_digest,  Usuario.digest(reset_token))
	    update_attribute(:reset_sent_at, Time.zone.now)
	  end

	  # Sends password reset email.
	  def send_password_reset_correo
	    UsuarioMailer.password_reset(self).deliver_now
	  end

		   # Returns true if a password reset has expired.
	  def password_reset_expired?
	    reset_sent_at < 2.hours.ago
	  end


  	  private

    # Converts email to all lower-case.
    def downcase_correo
      self.correo = correo.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Usuario.new_token
      self.activation_digest = Usuario.digest(activation_token)
    end
end
