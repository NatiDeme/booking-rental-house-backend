class Api::V1::TourController < ApplicationController
  def index
    @tours = Tour.all
    render json: @tours
  end
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    render json: { success: true, message: 'Tour deleted successfully'}, status: :ok
  end
end
