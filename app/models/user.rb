class User < ApplicationRecord
	validates_presence_of :email, :full_name, :location
	validates :bio, :length => {:minimum => 30, :allow_blank => false}
	validates :email, :format => {:with => /\S+@\S+\.\S+/, :uniqueness => true}
	
	has_secure_password
	
	before_create :generate_token
	
	def generate_token
		self.confirmation_token = SecureRandom.urlsafe_base64
	end
	
	def confirm!
		return if confirmed?
		
		self.confirmed_at = Time.current
		self.confirmation_token = ''
		save!
	end
	
	def confirmed?
		confirmed_at.present?
	end
end
