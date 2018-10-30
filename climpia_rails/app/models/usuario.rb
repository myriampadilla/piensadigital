class Usuario < ApplicationRecord
	has_secure_password
	before_save :downcase_email

    has_many :clientes
    
    #expresion regular
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :username, presence:true
    validates :id_tipo_usuario, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 4}
    validates :email, presence:true, length: {maximum:255}, 
        format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

    validates :password, presence:true, length: {minimum: 8},
      allow_nil: true

     private
     def downcase_email 
     	 #convierte a minuscula
     	 self.email.downcase!

     	
     end

end


