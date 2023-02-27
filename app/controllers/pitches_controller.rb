class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end

  def show
  end

  def edit
  end

  def new
    @pitch = Pitch.new
  end

  def create
    
  end

  def update
  end

  def destroy
  end


end
