class BookingsController < ApplicationController
  def show
  end

  def new
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.find(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date)
  end
end
