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
      @item.user_id = current_user.id
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
