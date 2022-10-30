class ReservationController < ApplicationController
    def create
      @reservation = reservation.new(reserve_params)
      @tour_id = params.permit(:tour_id)
      @tour = Tour.find_by(id: @tour_id['tour_id'])
      @reservation.tour = @tour
      @registration.user = current_user
      if @registration.save
      render json: @reservation, status: :created
    else
      render json: @reservation.error, status: :unprocessable_entity
    end

    end

    private

  def reserve_params
    params.permit(:date)
  end
end
