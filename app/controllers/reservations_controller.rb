class ReservationsController < ApplicationController

 def display_reservation
  @reservation = Reservation.all
  render json: {reservation: @reservation}
 end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :bike_id)
  end
end
