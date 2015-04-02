json.vehicle do 
  json.id    		  @vehicle.id
  json.category 	@vehicle.category
  json.make			  @vehicle.make
  json.model		  @vehicle.model
  json.color		  @vehicle.color
  json.year			  @vehicle.year
  json.owner		  @vehicle.owner
  json.price		  @vehicle.price
  json.address		@vehicle.address
  json.zip			  @vehicle.zip
  json.state		  @vehicle.state
  json.latitude		@vehicle.latitude
  json.longitude	@vehicle.longitude

  json.user_id @vehicle.user ? @vehicle.user.id : nil
end