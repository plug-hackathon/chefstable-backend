class RestrictedHoursController < ApplicationController
	before_action :set_restricted_hour, except: %i(index create)

	def index
		@restricted_hours = policy_scope(RestrictedHour)

		if params[:restaurant_id].present?
			@restricted_hours = @restricted_hours.where(restaurant_id: params[:restaurant_id])
		end

		render json: @restricted_hours
	end

	def show
		authorize @restricted_hour
		render json: @restricted_hour
	end

	def create
		@restricted_hour = RestrictedHour.new(restricted_hour_params)
		authorize @restricted_hour

		if @restricted_hour.save 
			render json: @restricted_hour
		else
			render json: { errors: @restricted_hour.errors }, status: :bad_request
		end
	end

	def update
		authorize @restricted_hour
		@restricted_hour.attributes = restricted_hour_params
		authorize @restricted_hour

		if @restricted_hour.save
			render json: @restricted_hour
		else
			render json: { errors: @restricted_hour.errors }, status: :bad_request
		end
	end

	def destroy
		authorize @restricted_hour
		head (@restricted_hour.destroy ? :ok : :bad_request)
	end

	private def restricted_hour_params
		params.require(:restricted_hour).permit(:from_datetime, :to_datetime, :restaurant_id)
	end

	private def set_restricted_hour 
		@restricted_hour = RestrictedHour.find(params[:id])
	end
end
