class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      render json: @booking
    else
      render json: { errors: @booking.errors }, status: :bad_request
    end
  end


  private def booking_params
    params.require(:booking).permit(:name, :phone_number, :number_of_persons, :starts_at)
  end
end
