class BookingsController < ApplicationController
  def index
    @my_bookings = current_user.bookings
    @booked = current_user.bookings_as_guide
  end

  def new
    @tour = Tour.find(params[:tour_id])
    authorize @tour
    @booking = Booking.new
    authorize @booking
  end

  def create
    @tour = Tour.find(params[:tour_id])
    authorize @tour
    @date = params[:booking][:date]
    @booking = Booking.new(date: @date, tour: @tour, user: current_user)
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :tour_id)
  end
end
