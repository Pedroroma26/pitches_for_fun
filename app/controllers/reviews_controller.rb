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
      redirect_to booking_path(@booking) # where do we whant to go after review saved?
    else
      render "review/show", status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
   # @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
   # @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
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
