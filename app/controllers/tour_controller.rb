class TourController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]

  def index
    @tours = Tour.all
    render json: @tours
  end

  def show
    @tour = Tour.find(params[:id])
    render json: @tour
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    render json: { success: true, message: 'Tour deleted successfully' }, status: :ok
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
    params.permit(:image, :city, :description, :price, :duration, :name)
  end
end
