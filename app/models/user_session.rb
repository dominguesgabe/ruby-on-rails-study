class UserSession
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming
	extend ActiveModel::Translation

	attr_accessor :email, :password
	validates_presence_of :email, :password
	def initialize(session, attributes={})
		@session = session
		@email = attributes[:email]
		@password = attributes[:password]
	end

	def authenticate
		user = User.authenticate(@email, @password)

		if user.present?
			store(user)
		else
			errors.add(:base, :invalid_login)
		end
	end

	def store(user)
		@session[:user_id] = user.id
	end
	def persisted?
		false
	end
end
