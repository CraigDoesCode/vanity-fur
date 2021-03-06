class BookingsController < ApplicationController
  def index
    @all_bookings = Booking.all
    @booking_requests = []
    @approved_requests = []
    @all_bookings.each do |booking|
      if booking.user_id == current_user.id
        if booking.confirmed == false && booking.notes != "rejected"
          @booking_requests.push(booking)
        else
          @approved_requests.push(booking)
        end
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item_id = @item.id
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def accept_booking
    @booking = Booking.find(params[:booking])
    @booking.confirmed = true
    @booking.save
    redirect_to my_items_path, notice: "Request Approved!"
  end

  def reject_booking
    @booking = Booking.find(params[:booking])
    @booking.confirmed = false
    @booking.notes = "rejected"
    @booking.save
    redirect_to my_items_path, notice: "Request Rejected"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :notes)
  end
end
