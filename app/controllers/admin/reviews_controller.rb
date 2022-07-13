class Admin::ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_review_path
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body, :star)
  end
end
