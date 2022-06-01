class UsersController < ApplicationController
  def show
    @items = Item.where(user: current_user)
  end
end
