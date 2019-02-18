class ToursController < ApplicationController
  before_action :find_tour, only: [:show, :edit, :update, :destroy]
  def index
    @tours = Tour.all
  end

  def show
  end

  def new
    @tour = Tour.new
  end

  def edit
  end

  def create
    @tour = Tour.new(tours_params)
    if @tour.save
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
    params.require(:tour).permit(:name, :price, :description, :city)
  end

  def find_tour
    @tour = Tour.find(params[:id])
  end
end
