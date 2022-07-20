class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    redirect_to store_reviews_path
  end

  def index
    @reviews = Review.where
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review.id)
  end

  private

  def review_params
    params.require(:review).permit(:store_id, :title, :body, :star, :image)
  end
end
