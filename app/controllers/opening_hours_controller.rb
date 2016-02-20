class OpeningHoursController < ApplicationController
	before_action :set_post, except: %i(index create)

	def index
		@opening_hours = policy_scope(OpeningHour)
		render json: @opening_hours
	end

	def show
		authorize @opening_hour
		render json: @opening_hour
	end

	def create
		authorize @opening_hour
		if @opening_hour.save
			render json: @opening_hour
		else
			render json: { errors: @opening_hour.errors }, status: :bad_request
		end
	end

	def update
		authorize @opening_hour
		@opening_hour.attributes = opening_hour_params
		authorize @opening_hour

		if @opening_hour.save
			render json: @opening_hour
		else
			render json: { errors: @opening_hour.errors }, status: :bad_request
		end
	end

	def destroy
		authorize @opening_hour
		head (@opening_hour.destroy ? :ok : :bad_request)
	end

	private def opening_hour_params
		params.require(:opening_hour).require(:week_day, :from_time, :to_time, :restaurant_id)
	end

	def set_opening_hour
		@opening_hour = OpeningHour.find(params[:id])
	end

end