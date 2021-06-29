class VehiclesController < ApplicationController
 before_action :find, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, only: :new

 def index
   @vehicles = policy_scope(Vehicle)
  end

  def show
   @booking = Booking.new
   authorize @vehicle
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
   @vehicle.update(vehicle_params)
   redirect_to vehicle_path(@vehicle)
  end

  def destroy
   @vehicle.destroy
   redirect_to vehicles_path
  end

  def edit
  end

  private

  def find
   @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
   params.require(:vehicle).permit(:category)
  end

end
