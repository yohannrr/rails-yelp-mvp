class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

def show
  @restaurant = Restaurant.find(params[:id])
  @review = @restaurant.reviews.build  # Initialize a new review object for the restaurant
end


  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, status: :see_other, notice: "Restaurant was successfully deleted."
  end

  private

  # Sets the restaurant for show, edit, update, and destroy actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to restaurants_url, alert: "Restaurant not found."
  end

  # Strong params for creating/updating restaurant.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
