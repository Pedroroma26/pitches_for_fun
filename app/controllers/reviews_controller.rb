class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :edit]
  before_action :set_review, only: [:update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @booking.user = current_user
    if @review.save
      redirect_to bookings_path
    else
      render "review/new", status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    @review.destroy
    redirect_to pitch_path(@review.booking.pitch), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
