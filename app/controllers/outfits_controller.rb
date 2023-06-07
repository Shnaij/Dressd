class OutfitsController < ApplicationController
  def index
    @shoes = Item.where(category: "Shoes")
    @dresses = Item.where(category: "Dresses")
    @tops = Item.where(category: "Tops")
    @bottoms = Item.where(category: "Bottoms")
  end

  def new
    @shoes = Item.where(category: "Shoes")
    @dresses = Item.where(category: "Dresses")
    @tops = Item.where(category: "Tops")
    @bottoms = Item.where(category: "Bottoms")
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

  def outfit_params
    params.require(:outfit).permit(:title)
  end
end
