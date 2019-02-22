class ReviewsController < ApplicationController
  def create
    skip_authorization
    @tour = Tour.find(params[:tour_id])
    @review = Review.new(review_params)
    @review.tour = @tour
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to tour_path(@tour) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'tours/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
