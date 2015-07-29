class UserGroupPermissionsController < ApplicationController
  before_action :set_user_group_permission, only: [:show, :edit, :update, :destroy]

  def index
    permission = Permission.find(params[:permission_id])
    @user_group_permissions = permission.user_group_permissions
    @user_group_permission = UserGroupPermission.new
  end

  def create
    @user_group_permission = UserGroupPermission.new(user_group_permission_params)
    permission = {permission_id: @user_group_permission.permission_id}
    
    respond_to do |format|
      if @user_group_permission.save
        flash[:success] = 'adicionado!'
        format.html {redirect_to user_group_permissions_path(permission) }
      else
        flash[:error] = 'não foi adicionado'
        format.html {redirect_to user_group_permissions_path(permission) }
      end
    end
  end

  def destroy
    @user_group_permission.destroy
    permission = {permission_id: @user_group_permission.permission_id}
    respond_to do |format|
      flash[:info] = 'Removido!'
      format.html { redirect_to user_group_permissions_path(permission) }
    end
  end

  private
    def set_user_group_permission
      @user_group_permission = UserGroupPermission.find(params[:id])
    end

    def user_group_permission_params
      params.require(:user_group_permission).permit(:user_group_id, :permission_id)
    end
end
