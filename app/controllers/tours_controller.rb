class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = Tour.new
  end

  def edit
    @tour = Tour.find(params[:id])
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
    @tour = Tour.find(params[:id])
    @tour.update(tours_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tours_path
  end

  private

  def tours_params
    params.require(:tour).permit(:name, :price, :description, :city)
  end
end
