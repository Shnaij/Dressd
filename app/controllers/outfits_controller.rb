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

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user_id = current_user.id
    if @outfit.save
      redirect_to outfits_path(@outfit), notice: "Outfit was successfully created, you can find it in your closet."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def outfit_params
    params.require(:outfit).permit(:title)
  end
end
