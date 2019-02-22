class ReviewsController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @review = Review.new(review_params)
    @review.tour = @tour
    if @review.save
      redirect_to tour_path(@tour)
    else
      render 'tours/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
