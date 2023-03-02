class PitchesController < ApplicationController
  before_action :set_pitch, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @pitches= Pitch.search_by_name_and_type(params[:query])
    else
      @pitches = Pitch.all
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.user = current_user

    if @pitch.save
      redirect_to pitches_path, notice: 'Pitch created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pitch.update(pitch_params)
      redirect_to pitch_path(@pitch)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pitch.destroy
    redirect_to pitches_path, status: :see_other
  end

  private

  def pitch_params
    params.require(:pitch).permit(:name, :price, :location, :pitch_type, :available, :photo)
  end

  def set_pitch
    @pitch = Pitch.find(params[:id])
  end
end
