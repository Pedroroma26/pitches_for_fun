class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end
  
  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_price, :pitch_id)
  end
end
