require 'test_helper'

class UserFrequenciesControllerTest < ActionController::TestCase
  setup do
    @user_frequency = user_frequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_frequency" do
    assert_difference('UserFrequency.count') do
      post :create, user_frequency: { date: @user_frequency.date, type: @user_frequency.type, user_id: @user_frequency.user_id }
    end

    assert_redirected_to user_frequency_path(assigns(:user_frequency))
  end

  test "should show user_frequency" do
    get :show, id: @user_frequency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_frequency
    assert_response :success
  end

  test "should update user_frequency" do
    patch :update, id: @user_frequency, user_frequency: { date: @user_frequency.date, type: @user_frequency.type, user_id: @user_frequency.user_id }
    assert_redirected_to user_frequency_path(assigns(:user_frequency))
  end

  test "should destroy user_frequency" do
    assert_difference('UserFrequency.count', -1) do
      delete :destroy, id: @user_frequency
    end

    assert_redirected_to user_frequencies_path
  end
end
