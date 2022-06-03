class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = <<~SQL
      items.name ILIKE :query
      OR items.description ILIKE :query
      OR users.first_name ILIKE :query
      OR users.last_name ILIKE :query
      SQL
      @items = Item.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all.reverse
    end
  end

  def show
    @booking = Booking.new
    @items = Item.where(category: @item.category)
  end

  def new
      @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      @item.user = current_user
      if @item.save
        redirect_to item_path(@item)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
      @item.update(item_params)

      redirect_to item_path(@item)
  end

  def destroy
      @item.destroy
      redirect_to items_path, status: :see_other
  end

  def my_items
    @items = Item.where(user_id: current_user.id)
    @all_bookings = Booking.all
    @booking_requests = []
    @approved_requests = []
    @all_bookings.each do |booking|
      @item = Item.find(booking.item_id)
      if @item.user_id == current_user.id
        if booking.confirmed == false && booking.notes != "rejected"
          @booking_requests.push(booking)
        else
          @approved_requests.push(booking)
        end
      end
    end
  end
  
  def shoes
    @items = Item.where(category: "shoes")
    render :index
  end

  def hats
    @items = Item.where(category: "hat")
    render :index
  end

  def hoodies
    @items = Item.where(category: "hoodie")
    render :index
  end

  def jackets
    @items = Item.where(category: "jacket")
    render :index
  end

  def harness
    @items = Item.where(category: "harness")
    render :index
  end

    private

  def item_params
      params.require(:item).permit(:price, :user_id, :name, :size, :availability, :description, :rating, photos: [])
  end

  def set_item
      @item = Item.find(params[:id])
  end
end
