json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :user_id, :category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state, :latitude, :longitude
  json.url vehicle_url(vehicle, format: :json)
end
