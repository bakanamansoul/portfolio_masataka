class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.store_id = params[:store_id]
    if @review.save
      redirect_to store_path(@review.store.id)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.customer == current_customer
      redirect_to store_review_path(@review.store_id, @review.id)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.customer != current_customer
      redirect_to store_review_path(@review.store_id, @review.id)
    else
      if @review.update(review_params)
        redirect_to store_review_path(@review.store_id, @review.id)
      else
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.customer != current_customer
      redirect_to store_review_path(@review.store_id, @review.id)
    else
      @review.destroy
      redirect_to store_path(@review.store_id)
    end
  end

  private

  def review_params
    params.require(:review).permit(:store_id, :title, :body, :star, :image)
  end
end
