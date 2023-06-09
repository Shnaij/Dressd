class OutfitsController < ApplicationController
  def index
    @outfits = current_user.outfits
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def new
    @outfit = Outfit.new
    @style_options = Style.all.pluck(:title)
    @items = current_user.items

    if params[:style].present?
      style = Style.find_by_title(params[:style])
      if style
        @items = current_user.items.joins(:item_styles).where(item_styles: { style_id: style.id })
      end
    end

    if params[:items_weathers].present?
      @items = current_user.items.joins(:items_weathers).where(items_weathers: { name: params[:items_weathers] })
    end

    @tops = @items.where(category: "Tops")
    if @tops.empty?
      @tops_message = "You have no tops in this search!"
      @tops = current_user.items.where(category: "Tops")
    end

    @bottoms = @items.where(category: "Bottoms")
    if @bottoms.empty?
      @bottoms_message = "You have no bottoms in this search!"
      @bottoms = current_user.items.where(category: "Bottoms")
    end

    @shoes = @items.where(category: "Shoes")
    if @shoes.empty?
      @shoes_message = "You have no shoes in this search!"
      @shoes = current_user.items.where(category: "Shoes")
    end

    @dresses = @items.where(category: "Dresses")
    if @dresses.empty?
      @dresses_message = "You have no dresses in this search!"
      @dresses = current_user.items.where(category: "Dresses")
    end

    @selected_category_is_default = true

    # picking up selected item and showing it in new outfit:
    if params[:item_id]
      item = Item.find(params[:item_id])
      @selected_category_is_dresses = item.category == "Dresses"
      @selected_category_is_default = item.category != "Dresses"
      case item.category
      when "Tops" then @tops = reindex_list(@tops, item)
      when "Bottoms" then @bottoms = reindex_list(@bottoms, item)
      when "Shoes" then @shoes = reindex_list(@shoes, item)
      when "Dresses" then @dresses = reindex_list(@dresses, item)
      end
    end

    # filtering logic automatic Stimulus
    respond_to do |format|
      format.html
      format.json
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
    items = []
    items << Item.find(params[:outfit][:top].to_i) unless params[:outfit][:top] == ""
    items << Item.find(params[:outfit][:bottom].to_i) unless params[:outfit][:bottom] == ""
    items << Item.find(params[:outfit][:dress].to_i) unless params[:outfit][:dress] == ""
    items << Item.find(params[:outfit][:shoe].to_i)
    items
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
