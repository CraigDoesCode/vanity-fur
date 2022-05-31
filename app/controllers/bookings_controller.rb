class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    flash[:notice] = @booking.errors.full_messages.to_sentence unless @booking.save
    redirect_to bookings_path(@bookings)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path(@bookings), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit()
  end
end
