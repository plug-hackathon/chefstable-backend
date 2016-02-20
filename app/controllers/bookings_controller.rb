class BookingsController < ApplicationController
  before_action :set_booking, except: %i(index create)

  def index
    @bookings = policy_scope(Booking)
    render json: @bookings
  end

  def show
    authorize @booking
    render json: @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      render json: @booking
    else
      render json: { errors: @booking.errors }, status: :bad_request
    end
  end

  def update
    authorize @booking
    @booking.attributes = booking_params
    authorize @booking

    if @booking.save
      render json: @booking
    else
      render json: { errors: @booking.errors }, status: :bad_request
    end
  end

  def destroy
    authorize @booking
    head (@booking.destroy ? :ok : :bad_request)
  end

  private def booking_params
    params.require(:booking).permit(:name, :phone_number, :number_of_persons, :starts_at)
  end

  private def set_booking
    @booking = Booking.find params[:id]
  end
end
