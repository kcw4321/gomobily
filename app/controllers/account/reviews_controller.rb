module Account
  class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def edit
      @review = Review.find(params[:id])
      authorize @review
    end

    def update
      @review = Review.find(params[:id])
      authorize @review
      @review.update(review_params)
      redirect_to account_profile_path
    end

    def destroy
      @review = Review.find(params[:id])
      authorize @review
      @review.destroy
      redirect_to account_profile_path
    end

    def review_params
      params.require(:review).permit(:content, :rating)
    end
  end
end
