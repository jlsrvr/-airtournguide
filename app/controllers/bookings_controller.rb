class BookingsController < ApplicationController
  skip_after_action :verify_authorized, only: :update
  def index
    @bookings = policy_scope(Booking)
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

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to ptours_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :date, :tour_id)
  end
end
