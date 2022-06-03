class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = <<~SQL
      items.name ILIKE :query
      OR items.description ILIKE :query
      OR users.first_name ILIKE :query
      OR users.last_name ILIKE :query
      OR items.address ILIKE :query
      SQL
      @items = Item.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      @markers = @items.geocoded.map do |item|
        {
          lat: item.latitude,
          lng: item.longitude,
          info_window: render_to_string(partial: "info_window", locals: {item: item}),
          image_url: helpers.asset_url("https://cdn0.iconfinder.com/data/icons/simple-pet/100/4-512.png")
        }
      end
    else
      @items = Item.all
      @markers = @items.geocoded.map do |item|
        {
          lat: item.latitude,
          lng: item.longitude,
          info_window: render_to_string(partial: "info_window", locals: {item: item}),
          image_url: helpers.asset_url("https://cdn0.iconfinder.com/data/icons/simple-pet/100/4-512.png")
        }
      end
    end
  end

  def show
    @booking = Booking.new
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

    private

  def item_params
      params.require(:item).permit(:price, :user_id, :name, :size, :availability, :description, :rating, photos: [])
  end

  def set_item
      @item = Item.find(params[:id])
  end

end
