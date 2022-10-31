class ReservationController < ApplicationController
    def create
      @reservation = Reservation.new(reserve_params)
      @tour_id = params.permit(:tour_id)
      @tour = Tour.find_by(id: @tour_id['tour_id'])
      @reservation.tours = @tour
      @reservation.user = current_user
      if @reservation.save
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
