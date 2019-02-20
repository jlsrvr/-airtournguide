class ToursController < ApplicationController
  before_action :find_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = policy_scope(Tour).order(created_at: :asc)
    @tours = Tour.where.not(latitude: nil, longitude: nil)

    @markers = @tours.map do |tour|
      {
        lng: tour.longitude,
        lat: tour.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { tour: tour })
      }
    end
  end

  def show
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def edit
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
