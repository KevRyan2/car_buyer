class Vehicle < ActiveRecord::Base
	# include PgSearch
	# multisearchable against: [:category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state]

	belongs_to :user
	geocoded_by :full_address
	after_validation :geocode

		  # require 'sinatra'
		  # require 'JSON'
		  # require 'vehicle'

		  # # list all
		  # get '/vehicle' do
		  #   vehicle.all.to_json
		  # end

		  # # view one
		  # get '/vehicles/:id' do
		  #   vehicle = vehicle.find(params[:id])
		  #   return status 404 if vehicle.nil?
		  #   vehicle.to_json
		  # end

		  # # create
		  # post '/vehicles' do
		  #   vehicle = vehicle.new(params['vehicle'])
		  #   vehicle.save
		  #   status 201
		  # end

		  # # update
		  # put '/vehicles/:id' do
		  #   vehicle = vehicle.find(params[:id])
		  #   return status 404 if vehicle.nil?
		  #   vehicle.update(params[:vehicle])
		  #   vehicle.save
		  #   status 202
		  # end

		  # delete '/vehicles/:id' do
		  #   vehicle = vehicle.find(params[:id])
		  #   return status 404 if vehicle.nil?
		  #   vehicle.delete
		  #   status 202
		  # end
			
	def full_address
		"#{address}, #{zip}, #{state}"
	end	

	def self.search (query)
		@vehicles = Vehicle.where("category iLIKE ? OR make iLIKE ? OR model iLIKE ? OR color iLIKE ? OR owner iLIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")	

	end

end