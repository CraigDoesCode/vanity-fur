class BookingsController < ApplicationController
  def index
    @items = Item.where(user: current_user)
    @all_bookings = Booking.all
    @booking_requests = []
    @all_bookings.each do |booking|
      @item = Item.find(booking.item_id)
      @booking_requests.push(booking) if @item.user_id == current_user.id && booking.confirmed == false
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
    # @booking.item.user.bookings.append(@booking)
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

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :notes)
  end

  def find_by(*args)
    where(*args).take
  end
end
