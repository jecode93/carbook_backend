class BikesController < ApplicationController
  # GET /bikes or /bikes.json
  def display_bikes
    @bikes = Bike.all
    render json: { bikes: @bikes }
  end

  # GET /bikes/1 or /bikes/1.json
  def show; end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit; end

  # POST /bikes or /bikes.json
  def create
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        format.html { redirect_to bike_url(@bike), notice: 'Bike was successfully created.' }
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikes/1 or /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to bike_url(@bike), notice: 'Bike was successfully updated.' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1 or /bikes/1.json
  def destroy
    @bike.destroy!

    respond_to do |format|
      format.html { redirect_to bikes_url, notice: 'Bike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bike
    @bike = Bike.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :image, :description, :deposit, :finance_fee, :option_to_purchase_fee,
                                 :total_amount_payable, :duration)
  end
end
