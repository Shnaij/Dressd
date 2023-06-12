class OutfitsController < ApplicationController
  def index
    @outfits = Outfit.where(user_id: current_user.id)

    # Search results
    if params[:query].present?
      @outfits = Outfit.outfit_search(params[:query])
    else
      @outfits = Outfit.where(user_id: current_user.id)
    end
  end
    # @shoes = Item.where(category: "Shoes")
    # @dresses = Item.where(category: "Dresses")
    # @tops = Item.where(category: "Tops")
    # @bottoms = Item.where(category: "Bottoms")

  def show
    @outfit = Outfit.find(params[:id])
  end

  def new
    @outfit = Outfit.new
    @items = Item.where(user_id: current_user.id)
    @shoes = @items.where(category: "Shoes")
    @dresses = @items.where(category: "Dresses")
    @tops = @items.where(category: "Tops")
    @bottoms = @items.where(category: "Bottoms")
    @item = Item.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user_id = current_user.id
    items = find_all_items
    if @outfit.save
      create_outfit_items(items, @outfit)
      redirect_to outfits_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def outfit_params
    params.require(:outfit).permit(:title)
  end

  def find_all_items
    top = Item.find(params[:outfit][:top].to_i)
    bottom = Item.find(params[:outfit][:bottom].to_i)
    shoe = Item.find(params[:outfit][:shoe].to_i)
    [top, bottom, shoe]
  end

  def create_outfit_items(items, outfit)
    items.each do |item|
      OutfitItem.create(item_id: item.id, outfit_id: outfit.id)
    end
  end
end
