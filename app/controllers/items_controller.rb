class ItemsController < ApplicationController

  def index
    @items = Item.where(user_id: current_user.id)
    @style_options = Style.all.pluck(:title)

    # Search results
    if params[:query].present?
      @items = @items.items_search(params[:query])
    else
      @items
    end

    # Additional logic for filtering
    if params[:category].present?
      @items = @items.where(category: params[:category])
    end

    if params[:style].present?
      style = Style.find_by_title(params[:style])
      if style
        @items = current_user.items.joins(:item_styles).where(item_styles: { style_id: style.id })
      end
    end

    # Determine the filtered category
    @filtered_category = params[:category]
    @filtered_category = params[:style]

    # Filtered category headers
    @dresses_header = 'Dresses'
    @tops_header = 'Tops'
    @bottoms_header = 'Bottoms'
    @shoes_header = 'Shoes'

    # Categorize items for the view
    @shoes = @items.where(category: "Shoes")
    @dresses = @items.where(category: "Dresses")
    @tops = @items.where(category: "Tops")
    @bottoms = @items.where(category: "Bottoms")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      create_items_weathers(@item)
      redirect_to items_path(@item), notice: "Item was successfully created, you can find it in your closet."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    Outfit.joins(:outfit_items).where(outfit_items: {item_id: item.id}).destroy_all
    item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def create_items_weathers(item)
    params[:item][:items_weathers][1..-1].each do |name|
      ItemsWeather.create(name: name, item_id: item.id)
    end
  end

  def item_params
    params.require(:item).permit(:title, :brand, :category, :color, :original_price, :photo)
  end
end
