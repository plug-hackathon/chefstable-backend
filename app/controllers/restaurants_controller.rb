class RestaurantsController < ApplicationController
	def index
		@restaurants = policy_scope(Restaurant)
	end 

	def show 
		@restaurant = Restaurant.find(params[:id])
		
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		authorize @restaurant
		@restaurant.save
	end

	def update 
	end

	def destroy
	end

	private def restaurant_params 
		params.require(:restaurant).permit(:name, :time_zone)
	end

end
