class ReviewsController < ApplicationController
  before_action :set_location
  def new
    @review = Review.new
    @review.location = @location
    authorize @review
  end
  def create
    @review = @location.reviews.build(review_params)
    authorize @review
    if @review.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
