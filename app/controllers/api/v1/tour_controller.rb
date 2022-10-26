class Api::V1::TourController < ApplicationController
  def index
    @tour = Tour.all
    render json: @tour
  end

  def create 
    @newTour = Tour.new(tour_params)
    @newTour.user = authenticate_token!
    if @newTour.save
      render json: @newTour, status: :created
    else
      render json: @newTour.error, status: :unprocessable_entity
  end

  private
  def tour_params
    params.require(:tour).permit(:image,:city,:description,:price,:duration)
end
