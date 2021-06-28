class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @booking.vehicle = @vehicle
      if @booking.save
        @booking.save
        redirect_to vehicle_bookings_path(@vehicle)
      else
        render :new
      end
  end

  def destroy
    @booking = Booking.find(params[:id])
    vehicle = @booking.vehicle
    @booking.destroy
    redirect_to vehicle_path(vehicle)
  end

  def index
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
