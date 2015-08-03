class UserFrequenciesController < ApplicationController
  before_action :set_user_frequency, only: [:show, :edit, :update, :destroy]

  # GET /user_frequencies
  # GET /user_frequencies.json
  def index
    @user_frequencies = UserFrequency.all
  end

  # GET /user_frequencies/1
  # GET /user_frequencies/1.json
  def show
  end

  # GET /user_frequencies/new
  def new
    @user_frequency = UserFrequency.new
  end

  # GET /user_frequencies/1/edit
  def edit
  end

  # POST /user_frequencies
  # POST /user_frequencies.json
  def create
    @user_frequency = UserFrequency.new(user_frequency_params)

    respond_to do |format|
      if @user_frequency.save
        format.html { redirect_to @user_frequency, notice: 'User frequency was successfully created.' }
        format.json { render :show, status: :created, location: @user_frequency }
      else
        format.html { render :new }
        format.json { render json: @user_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_frequencies/1
  # PATCH/PUT /user_frequencies/1.json
  def update
    respond_to do |format|
      if @user_frequency.update(user_frequency_params)
        format.html { redirect_to @user_frequency, notice: 'User frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_frequency }
      else
        format.html { render :edit }
        format.json { render json: @user_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_frequencies/1
  # DELETE /user_frequencies/1.json
  def destroy
    @user_frequency.destroy
    respond_to do |format|
      format.html { redirect_to user_frequencies_url, notice: 'User frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_frequency
      @user_frequency = UserFrequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_frequency_params
      params.require(:user_frequency).permit(:date, :user_id, :type)
    end
end
