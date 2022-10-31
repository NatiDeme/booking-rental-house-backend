class ReservationController < ApplicationController
    def index
    @reservations = @current_user.reservations
    @result = []
    @reservations.each do |reserved|
      @result << { tour: Tour.find(reserved.tours_id), date: reserved.date, reservation_id: reserved.id }
    end
    render json: @result
  end

  def show
    @tour = Tour.find(params[:id])
    render json: @tour
  end

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

    def destroy
    @current_user.reservations.find(params[:id]).destroy
  end

    end

    private

  def reserve_params
    params.permit(:date)
  end
end
