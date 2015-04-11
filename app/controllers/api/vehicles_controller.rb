module Api
  class VehiclesController < Api::BaseController
 #    # http_basic_authenticate_with :name => "fast", :password => "furious"
 #   skip_before_filter :authenticate_vehicle! # we do not need devise authentication here
 #   before_filter :fetch_vehicle, :except => [:index, :create]

    def index
      @vehicles = Vehicle.all
      render json: @vehicles, status: :ok
    end

    def show
      render json: @vehicle 
    end

    def destroy
      @vehicle.destroy

      head :no_content
    end  


    def update
      if @vehicle.update(vehicle_params)
        head :no_content
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end    
    end

    def create
      @vehicle = Vehicle.new(params[:vehicle])

      if @vehicle.save
        render json: @vehicle, status: :created
      else
        render json: @vehicle.errors, status: :unprocessable_entity  
      end

    end
    

    private

      def set_vehicle
          @vehicle = Vehicle.find(params[:id])
      end    

      def vehicle_params
        params.require(:vehicle).permit(:id, :category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state, :latitude, :longitude)
      end

      def query_params
        # this assumes that a vehicle belongs to a vehicle and has a :vehicle_id
        # allowing us to filter by this
        params.permit(:vehicle_id, :category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state, :latitude, :longitude)
      end

  end
end