class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations.reverse
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
  end

  def delete
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :guest_count)
  end

end
