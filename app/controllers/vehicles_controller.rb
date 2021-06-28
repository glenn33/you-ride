class VehiclesController < ApplicationController
 before_action :find, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!, only: :new
 def index
   @vehicles = Vehicle.all
  end

  def show
   @booking = Booking.new
  end

  def new
   @vehicle = Vehicle.new
  end

  def create
   @vehicle = Vehicle.new(vehicle_params)
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
