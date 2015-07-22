require 'test_helper'

class UserGroupPermissionsControllerTest < ActionController::TestCase
  setup do
    @user_group_permission = user_group_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_group_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_group_permission" do
    assert_difference('UserGroupPermission.count') do
      post :create, user_group_permission: { permission_id: @user_group_permission.permission_id, user_group_id: @user_group_permission.user_group_id }
    end

    assert_redirected_to user_group_permission_path(assigns(:user_group_permission))
  end

  test "should show user_group_permission" do
    get :show, id: @user_group_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_group_permission
    assert_response :success
  end

  test "should update user_group_permission" do
    patch :update, id: @user_group_permission, user_group_permission: { permission_id: @user_group_permission.permission_id, user_group_id: @user_group_permission.user_group_id }
    assert_redirected_to user_group_permission_path(assigns(:user_group_permission))
  end

  test "should destroy user_group_permission" do
    assert_difference('UserGroupPermission.count', -1) do
      delete :destroy, id: @user_group_permission
    end

    assert_redirected_to user_group_permissions_path
  end
end
