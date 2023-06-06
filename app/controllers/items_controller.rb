class ItemsController < ApplicationController
  def index
    @shoes = Item.where(category: "shoes")
    @dresses = Item.where(category: "dresses")
    @tops = Item.where(category: "tops")
    @bottoms = Item.where(category: "bottoms")
  end
end
