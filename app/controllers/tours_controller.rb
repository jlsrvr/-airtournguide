class ToursController < ApplicationController
  before_action :find_tour, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if params[:query].present?
      @tours = Tour.search_by_city(params[:query])
      @tours_for_map = @tours.where.not(latitude: nil, longitude: nil)
    else
      @tours = Tour.all
      @tours_for_map = @tours.where.not(latitude: nil, longitude: nil)
    end

    @markers = @tours_for_map.map do |tour|
      {
        lng: tour.longitude,
        lat: tour.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { tour: tour })
        image_url: helpers.asset_url('noun_Flag_2226775.png')
      }
    end
  end

  def show
    @booking = Booking.new
    @tour = Tour.find(params[:id])

    @marker = [{
      lng: @tour.longitude,
      lat: @tour.latitude,
      image_url: helpers.asset_url('noun_Flag_2226775.png')
    }]
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
