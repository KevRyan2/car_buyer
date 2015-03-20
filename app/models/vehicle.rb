class Vehicle < ActiveRecord::Base
	# include PgSearch
	# multisearchable against: [:category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state]
	
	belongs_to :user
	geocoded_by :full_address
	after_validation :geocode

	def full_address
		"#{address}, #{zip}, #{state}"
	end	

	def self.search (query)
		where("category like?", "%#{query}%")	
	end

end