class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  before_action only: [:index, :new, :edit, :show, :create, :update, :destroy] do
    redirect_to notfound_path unless authenticated?
  end

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)

    hour = shift_params[:begin].split(":").at(0)
    minute = shift_params[:begin].split(":").at(1)
    time = Time.new(2000, 1, 1, hour, minute, 0)

    @shift.begin = time

    hour = shift_params[:end].split(":").at(0)
    minute = shift_params[:end].split(":").at(1)
    time = Time.new(2000, 1, 1, hour, minute, 0)
    @shift.end = time

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    hour = shift_params[:begin].split(":").at(0)
    minute = shift_params[:begin].split(":").at(1)
    time = Time.new(2000, 1, 1, hour, minute, 0)

    @shift.begin = time

    hour = shift_params[:end].split(":").at(0)
    minute = shift_params[:end].split(":").at(1)
    time = Time.new(2000, 1, 1, hour, minute, 0)
    @shift.end = time
    
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
      @shift.begin = format_time @shift.begin
      @shift.end = format_time @shift.end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:name, :description, :begin, :end)
    end
end
