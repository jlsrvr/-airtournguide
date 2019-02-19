class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @date = "#{booking_params['date(2i)']}#{booking_params['date(3i)']}#{booking_params['date(1i)']}"
    @booking = Booking.new(date: @date, tour: @tour, user: current_user)
    if @booking.save
      redirect_to tours_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :tour_id)
  end
end
