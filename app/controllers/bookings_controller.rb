class BookingsController < ApplicationController
 before_action :authenticate_user!, only: :create
 before_action :skip_authorization, only: :rentals

 def create
    @booking = Booking.new(booking_params)
    authorize @booking
    vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = vehicle
    @booking.user = current_user
      if @booking.save
       redirect_to bookings_path
      else
       redirect_to vehicle_path(vehicle)
      end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to vehicles_path
  end

  def index
    @bookings = policy_scope(current_user.bookings)
  end

  def rentals
   @rentals = current_user.vehicles.map do |vehicle|
    vehicle.bookings
   end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
