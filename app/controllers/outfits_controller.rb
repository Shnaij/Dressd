class OutfitsController < ApplicationController
  def index
    @outfits = current_user.outfits    # Outfit.all

    # Search results
    if params[:query].present?
      @outfits = Outfit.outfit_search(params[:query]) # filtering on current user needed?
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def new
    @outfit = Outfit.new

    @items = current_user.items
    @tops = @items.where(category: "Tops")
    @bottoms = @items.where(category: "Bottoms")
    @shoes = @items.where(category: "Shoes")
    @dresses = @items.where(category: "Dresses")

    if params[:item_id]
      item = Item.find(params[:item_id])
      case item.category
      when "Tops" then @tops = reindex_list(@tops, item)
      when "Bottoms" then @bottoms = reindex_list(@bottoms, item)
      when "Shoes" then @shoes = reindex_list(@shoes, item)
      when "Dresses" then @dresses = reindex_list(@dresses, item)
      end
    end
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

  def destroy
    outfit = Outfit.find(params[:id])
    outfit.destroy
    redirect_to outfits_path, status: :see_other
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

  def reindex_list(items, item)
    items = items.to_a
    items.delete(item)
    items.unshift(item)
  end
end
