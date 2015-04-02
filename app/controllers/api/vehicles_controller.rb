module Api
  class VehiclesController < Api::BaseController



    private

      def vehicle_params
        params.require(:vehicle).permit(:user_id, :category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state, :latitude, :longitude)
      end

      def query_params
        # this assumes that a vehicle belongs to a user and has a :user_id
        # allowing us to filter by this
        params.permit(:user_id, :params)
      end

  end
end