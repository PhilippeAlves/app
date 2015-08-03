class UserFrequenciesController < ApplicationController
  before_action :set_user_frequency, only: [:show, :edit, :update, :destroy]

  before_action only: [:index, :new, :edit, :show, :update, :destroy] do
    redirect_to notfound_path unless authenticated?
  end

  def index
    user_id = params[:user_id]

    unless params[:filter].nil?
      date_begin = DateTime.parse(params[:filter][:date_begin])
      date_end = DateTime.parse(params[:filter][:date_end])
    end

    if (date_begin.nil? || date_end.nil?)
      today = DateTime.now
      date_begin = DateTime.new(today.year, today.month, today.day, 0, 0, 0)
      date_end = DateTime.new(today.year, today.month, today.day, 23, 58, 59)
    else
      date_begin = DateTime.new(date_begin.year, date_begin.month, date_begin.day, 0, 0, 0)
      date_end = DateTime.new(date_end.year, date_end.month, date_end.day, 23, 58, 59)
    end

    if user_id.nil?
      @user_frequencies = UserFrequency.where(date: date_begin..date_end)
    else
      @user_frequencies = UserFrequency.where(user_id: user_id, date: date_begin..date_end)
    end
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
      
      @user_frequency = UserFrequency.new
      @user_frequency.user = user
      @user_frequency.date = DateTime.now

      par = (user.user_frequencies.count % 2 == 0)

      if par
        @user_frequency.type_frequency = "Entrada"
      else
        @user_frequency.type_frequency = "Saída"
      end

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
      params.require(:user_frequency).permit(:date, :user_id, :type_frequency)
    end
end
