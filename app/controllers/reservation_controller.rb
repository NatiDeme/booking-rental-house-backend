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
    @reservation = Reservation.find(params[:id])
    render json: { tour: Tour.find(@reservation.tours_id), date: @reservation.date, reservation_id: @reservation.id }
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
  end

  def destroy
    if @current_user.reservations.find(params[:id]).destroy
      render json: { success: true, message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: @reservation.error, status: :unprocessable_entity
    end
  end

  private

  def reserve_params
    params.permit(:date)
  end
end
