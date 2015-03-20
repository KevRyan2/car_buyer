class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user, only: [:new, :edit]
  
  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
    @miles = params[:miles]
    @category = params[:category]
    @make = params[:make]
    @model= params[:model]
    @year = params[:year]
    @color = params[:color]
    @owner = params[:owner]
    
    

    @hash = Gmaps4rails.build_markers(@vehicles) do |vehicle, marker|
        marker.lat vehicle.latitude
        marker.lng vehicle.longitude
    end
     if params[:search_map].present?
        @vehicles = Vehicle.near(params[:search_map], @miles, :order => :address)
        @hash = Gmaps4rails.build_markers(@vehicles) do |vehicle, marker|
          marker.lat vehicle.latitude
          marker.lng vehicle.longitude
        end
     else
        @vehicles = Vehicle.all
     end  

      if params[:search]
        @vehicles = Vehicle.search(params[:search])
      else 
        @vehicles = Vehicle.all
     end    
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  #GET "vehicles/search"
  def search
    if params.empty?
      gflash notice: "Must search with a term figure it out"
      redirect_to "vehicles/index"
    else
      search_map(@vehicles)
    end
  end
  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def authenticate_user
        redirect_to new_user_session_url unless user_signed_in?
    end  

    # def sort_column
    #   Vehicle.column_names.include?(params[:sort]) ? params[:sort] : "name"
    # end


    # def sort_direction
    #   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    # end

    private


      def search_map(vehicles)
          
          @vehicles = Vehicle.near(params[:search_map], @miles, :order => :address)
          @hash = Gmaps4rails.build_markers(@vehicles) do |vehicle, marker|
          marker.lat vehicle.latitude
          marker.lng vehicle.longitude
          end
      end
     

      # Use callbacks to share common setup or constraints between actions.
      def set_vehicle
        @vehicle = Vehicle.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def vehicle_params
        params.require(:vehicle).permit(:user_id, :category, :make, :model, :color, :year, :owner, :price, :address, :zip, :state, :latitude, :longitude)
      end
end

