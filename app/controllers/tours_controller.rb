class ToursController < ApplicationController
  before_action :find_tour, only: [:show, :edit, :update, :destroy]

  def index
    skip_policy_scope
    @tours = Tour.where.not(latitude: nil, longitude: nil)

    @markers = @tours.map do |tour|
      {
        lng: tour.longitude,
        lat: tour.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { tour: tour })
      }
    end
  end

  def personal_index
    @tours = policy_scope(Tour)
    @bookings = Booking.all.select { |booking| booking.tour.user == current_user }

    # @current_user_id = current_user.id.to_s
    # @tours = Tour.where(params[:user_id] = @current_user_id)
  end

  def show

  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def edit
    authorize @tour
  end

  def create
    @tour = Tour.new(tours_params)
    authorize @tour
    @tour.user = current_user
    if @tour.save!
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def update
    authorize @tour
    @tour.update(tours_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  private

  def tours_params
    params.require(:tour).permit(:name, :price, :description, :city, :photo)
  end

  def find_tour
    @tour = Tour.find(params[:id])
    authorize @tour
  end
end
