class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @items = Item.all
    @hats = Item.where(category: "hat").first(4)
    @shoes = Item.where(category: "shoes").first(4)
    @hoodies = Item.where(category: "hoodie").first(4)
    @harnesses = Item.where(category: "harness").first(4)
    @jackets = Item.where(category: "jacket").first(4)
  end
end
