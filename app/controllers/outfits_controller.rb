class OutfitsController < ApplicationController
  def index
    @shoes = Item.where(category: "shoes")
    @dresses = Item.where(category: "dresses")
    @tops = Item.where(category: "tops")
    @bottoms = Item.where(category: "bottoms")
  end

  def new
    @shoes = Item.where(category: "shoes")
    @dresses = Item.where(category: "dresses")
    @tops = Item.where(category: "tops")
    @bottoms = Item.where(category: "bottoms")
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path(@item), notice: "Outfit was successfully uploaded, you can find it in your closet."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :brand, :category, :color, :original_price, :photo)
  end
end
