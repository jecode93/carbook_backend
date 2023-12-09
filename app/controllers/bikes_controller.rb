class BikesController < ApplicationController
  def display_bikes
    @bikes = Bike.order(created_at: :desc)
    render json: { bikes: @bikes }
  end

  # POST /bikes or /bikes.json
  def create
    @bike = Bike.new(bike_params.merge(user_id: @current_user.id))
    if @bike.save
      render json: { message: 'Bike has been created' }
    else
      render json: { errors: @bike.errors.full_messages, status: :unprocessable_entity }
    end
  end

  # DELETE /bikes/1 or /bikes/1.json
  def destroy
    @bike = Bike.find(params[:id])
    if @bike.destroy
      render json: { message: 'Your bike has been  deleted' }
    else
      render json: @bike.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :image, :description, :deposit, :finance_fee, :option_to_purchase_fee,
                                 :total_amount_payable, :duration)
  end
end
