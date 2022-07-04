class Room < ApplicationRecord
	validates_presence_of :title, :location
	validates :description, :length => {:minimum => 30}
	
	def complete_name
		"#{title}, #{location}"
	end
end
