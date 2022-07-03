class User < ApplicationRecord
	validates_presence_of :email, :full_name, :location
	validates :bio, :length => {:minimum => 30, :allow_blank => false}
	validates :email, :format => {:with => /\S+@\S+\.\S+/, :uniqueness => true}
	
	has_secure_password
end
