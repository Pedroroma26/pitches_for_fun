class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to path_path(@booking) # where do we whant to go after review saved?
    else
      render "review/show", status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy
    
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
