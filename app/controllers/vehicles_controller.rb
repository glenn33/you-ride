class VehiclesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :new

def index
  @vehicles = policy_scope(Vehicle)
  if params[:query].present?
    @vehicles = Vehicle.near(params[:query], 10)
    if @vehicles == []
      @vehicles = Vehicle.all 
    else 
      @vehicles = Vehicle.where(category: params[:category], id: @vehicles.collect(&:id))
      @vehicles = @vehicles.where(price: (0..params[:price].to_i)) if params[:price].present?
    end
  end
  @markers = @vehicles.geocoded.map do |vehicle|
    {
      lat: vehicle.latitude,
      lng: vehicle.longitude,
      info_window: render_to_string(partial: "info_window", locals: { vehicle: vehicle })
    }
    end
end

  def show
    @booking = Booking.new
    authorize @vehicle
    @marker = [{lat:@vehicle.geocode[0], lng:@vehicle.geocode[1] }]
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    authorize @vehicle
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def update
    authorize @vehicle
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    authorize @vehicle
    @vehicle.destroy
    redirect_to vehicles_path
  end

  def edit
    authorize @vehicle
  end

  private

  def find
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:category, :price, :title, :location, :description, :image_url)
  end

end

