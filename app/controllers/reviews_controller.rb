class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
