class HomeController < ApplicationController
	def index
		@rooms = Room.limit(3).order(created_at: :desc)
	end
end
