class BookingsController < ApplicationController
 before_action :authenticate_user!, only: :create
 
 def create
    @booking = Booking.new(booking_params)
    authorize @booking
    vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = vehicle
    @booking.user = current_user
      if @booking.save
       redirect_to vehicle_bookings_path(vehicle)
      else
       redirect_to vehicle_path(vehicle)
      end
  end

  def destroy
    @booking = Booking.find(params[:id])
    vehicle = @booking.vehicle
    @booking.destroy
    redirect_to vehicle_path(vehicle)
  end

  def index
    @bookings = policy_scope(current_user.bookings)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
