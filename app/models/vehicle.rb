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
		@vehicles = Vehicle.where("category iLIKE ? OR make iLIKE ? OR model iLIKE ? OR color iLIKE ? OR owner iLIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")	

	end

end