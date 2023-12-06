class ReservationsController < ApplicationController
  def create_reservation
    @reservebike = Reservation.new(reservation_params.merge(user_id: @current_user.id))

    if @reservebike.save
      render json: { message: 'Your bike has been reserved' }
    else
      render json: @reservebike.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :bike_id)
  end
end
