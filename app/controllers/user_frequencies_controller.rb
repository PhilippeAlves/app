class UserFrequenciesController < ApplicationController
  before_action :set_user_frequency, only: [:show, :edit, :update, :destroy]

  def index
    @user_frequencies = UserFrequency.all
  end

  def show
  end

  def new
    @user_frequency = UserFrequency.new
  end

  def edit
  end

  def create
    user = User.where(card: params[:frequency][:card]).first

    unless user.nil?
      puts '##################################################'
      @user_frequency = UserFrequency.new
      @user_frequency.user = user
      @user_frequency.date = DateTime.now

      unless @user_frequency.save
        @user_frequency = nil
      end
    end

    render 'welcome/frequency_feedback'
  end

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

  def destroy
    @user_frequency.destroy
    respond_to do |format|
      format.html { redirect_to user_frequencies_url, notice: 'User frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_frequency
      @user_frequency = UserFrequency.find(params[:id])
    end

    def user_frequency_params
      params.require(:user_frequency).permit(:date, :user_id, :type)
    end
end
