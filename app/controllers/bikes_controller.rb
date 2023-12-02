class BikesController < ApplicationController

  # GET /bikes or /bikes.json
  def display_bikes
    @bikes = Bike.all
    render json: { bikes: @bikes }
  end
end
