require 'test_helper'

class PropertyReservationsControllerTest < ActionController::TestCase
  setup do
    @property_reservation = property_reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_reservation" do
    assert_difference('PropertyReservation.count') do
      post :create, property_reservation: { property_id: @property_reservation.property_id, reservation_id: @property_reservation.reservation_id, returned: @property_reservation.returned }
    end

    assert_redirected_to property_reservation_path(assigns(:property_reservation))
  end

  test "should show property_reservation" do
    get :show, id: @property_reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_reservation
    assert_response :success
  end

  test "should update property_reservation" do
    patch :update, id: @property_reservation, property_reservation: { property_id: @property_reservation.property_id, reservation_id: @property_reservation.reservation_id, returned: @property_reservation.returned }
    assert_redirected_to property_reservation_path(assigns(:property_reservation))
  end

  test "should destroy property_reservation" do
    assert_difference('PropertyReservation.count', -1) do
      delete :destroy, id: @property_reservation
    end

    assert_redirected_to property_reservations_path
  end
end
