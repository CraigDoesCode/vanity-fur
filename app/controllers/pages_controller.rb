class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @items = Item.all
    @hats = Item.where(category: "hat")
    @shoes = Item.where(category: "shoes")
    @hoodies = Item.where(category: "hoodie")
    @harnesses = Item.where(category: "harness")
    @jackets = Item.where(category: "jacket")
  end
end
