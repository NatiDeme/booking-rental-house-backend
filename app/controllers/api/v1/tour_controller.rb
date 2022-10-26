class Api::V1::TourController < ApplicationController
  before_action :authenticate_user!
  def index
    @tour = Tour.all
    render json: @tour
  end

  def create
    @new_tour = Tour.new(tour_params)
    @new_tour.user = current_user
    if @new_tour.save
      render json: @new_tour, status: :created
    else
      render json: @new_tour.error, status: :unprocessable_entity
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:image, :city, :description, :price, :duration)
  end
end
