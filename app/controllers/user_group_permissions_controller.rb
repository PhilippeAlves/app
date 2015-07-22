class UserGroupPermissionsController < ApplicationController
  before_action :set_user_group_permission, only: [:show, :edit, :update, :destroy]

  # GET /user_group_permissions
  # GET /user_group_permissions.json
  def index
    @user_group_permissions = UserGroupPermission.all
  end

  # GET /user_group_permissions/1
  # GET /user_group_permissions/1.json
  def show
  end

  # GET /user_group_permissions/new
  def new
    @user_group_permission = UserGroupPermission.new
  end

  # GET /user_group_permissions/1/edit
  def edit
  end

  # POST /user_group_permissions
  # POST /user_group_permissions.json
  def create
    @user_group_permission = UserGroupPermission.new(user_group_permission_params)

    respond_to do |format|
      if @user_group_permission.save
        format.html { redirect_to @user_group_permission, notice: 'User group permission was successfully created.' }
        format.json { render :show, status: :created, location: @user_group_permission }
      else
        format.html { render :new }
        format.json { render json: @user_group_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_group_permissions/1
  # PATCH/PUT /user_group_permissions/1.json
  def update
    respond_to do |format|
      if @user_group_permission.update(user_group_permission_params)
        format.html { redirect_to @user_group_permission, notice: 'User group permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_group_permission }
      else
        format.html { render :edit }
        format.json { render json: @user_group_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_group_permissions/1
  # DELETE /user_group_permissions/1.json
  def destroy
    @user_group_permission.destroy
    respond_to do |format|
      format.html { redirect_to user_group_permissions_url, notice: 'User group permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_group_permission
      @user_group_permission = UserGroupPermission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_group_permission_params
      params.require(:user_group_permission).permit(:user_group_id, :permission_id)
    end
end
