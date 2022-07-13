class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    review = Review.new
    review.save
    redirect_to reviews_path
  end

  def index
    @reviews = Review.all
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
    params.require(:review).permit(:title, :body, :s)
  end
end
