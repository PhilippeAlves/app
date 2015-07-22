class PropertyReservationsController < ApplicationController
  before_action :set_property_reservation, only: [:show, :edit, :update, :destroy]

  # GET /property_reservations
  # GET /property_reservations.json
  def index
    @property_reservations = PropertyReservation.all
  end

  # GET /property_reservations/1
  # GET /property_reservations/1.json
  def show
  end

  # GET /property_reservations/new
  def new
    @property_reservation = PropertyReservation.new
  end

  # GET /property_reservations/1/edit
  def edit
  end

  # POST /property_reservations
  # POST /property_reservations.json
  def create
    @property_reservation = PropertyReservation.new(property_reservation_params)

    respond_to do |format|
      if @property_reservation.save
        format.html { redirect_to @property_reservation, notice: 'Property reservation was successfully created.' }
        format.json { render :show, status: :created, location: @property_reservation }
      else
        format.html { render :new }
        format.json { render json: @property_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_reservations/1
  # PATCH/PUT /property_reservations/1.json
  def update
    respond_to do |format|
      if @property_reservation.update(property_reservation_params)
        format.html { redirect_to @property_reservation, notice: 'Property reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_reservation }
      else
        format.html { render :edit }
        format.json { render json: @property_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_reservations/1
  # DELETE /property_reservations/1.json
  def destroy
    @property_reservation.destroy
    respond_to do |format|
      format.html { redirect_to property_reservations_url, notice: 'Property reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_reservation
      @property_reservation = PropertyReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_reservation_params
      params.require(:property_reservation).permit(:returned, :property_id, :reservation_id)
    end
end
