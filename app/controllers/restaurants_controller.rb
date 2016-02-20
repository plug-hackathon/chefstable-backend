class RestaurantsController < ApplicationController
  before_action :set_post, except: %i(index create)

  def index
    @restaurants = policy_scope(Restaurant)
    render json: @restaurants
  end 

  def show 
    authorize @restaurant
    render json: @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    if @restaurant.save
      render json: @restaurant
    else
      render json: { errors: @restaurant.errors }, status: :bad_request
    end
  end

  def update 
    authorize @restaurant
    @restaurant.attributes = restaurant_params
    authorize @restaurant

    if @restaurant.save
      render json: @restaurant
    else 
      render json: { errors: @restaurant.errors }, status: :bad_request
    end
  end

  def destroy
    authorize @restaurant
    head (@restaurant.destroy ? :ok : :bad_request)
  end

  private def restaurant_params 
    params.require(:restaurant).permit(:name, :time_zone)
  end

  private def set_restaurant 
    @restaurant = Restaurant.find(params[:id])
  end 
end
