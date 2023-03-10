class BookingsController < ApplicationController

  before_action :set_pitch, only: %i[new create]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pitch = @pitch
    @booking.user = current_user
    if @booking.save
      @booking.total_price = duration * @pitch.price
      @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.total_price = (duration * @booking.pitch.price).round(2)
      @booking.save
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_pitch
    @pitch = Pitch.find(params[:pitch_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :pitch_id)
  end

  def duration
    (@booking.end_time - @booking.start_time) / (3600 * 24)
  end
end
