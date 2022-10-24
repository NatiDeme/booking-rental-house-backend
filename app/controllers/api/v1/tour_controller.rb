class Api::V1::TourController < ApplicationController
  def index
    @tour = Tour.all
    render json: @tour
  end
end
