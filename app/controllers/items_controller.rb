class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
      @items = Item.all
  end

  def show
  end

  def new
      @item = Item.new
  end

  def create
      @item = Item.new(item_params)
      @item.save
      # No need for app/views/restaurants/create.html.erb
      redirect_to item_path(@item)
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
      params.require(:item).permit(:price, :user_id, :name, :size, :availability, :description, :rating)
  end

  def set_item
      @item = Item.find(params[:id])
  end
end
