require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { address: @vehicle.address, category: @vehicle.category, color: @vehicle.color, latitude: @vehicle.latitude, longitude: @vehicle.longitude, make: @vehicle.make, model: @vehicle.model, owner: @vehicle.owner, price: @vehicle.price, state: @vehicle.state, user_id: @vehicle.user_id, year: @vehicle.year, zip: @vehicle.zip }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { address: @vehicle.address, category: @vehicle.category, color: @vehicle.color, latitude: @vehicle.latitude, longitude: @vehicle.longitude, make: @vehicle.make, model: @vehicle.model, owner: @vehicle.owner, price: @vehicle.price, state: @vehicle.state, user_id: @vehicle.user_id, year: @vehicle.year, zip: @vehicle.zip }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
