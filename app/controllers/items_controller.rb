class ItemsController < ApplicationController

  def index
    @items = current_user.items # Item.all

    # Search results
    if params[:query].present?
      @items = Item.items_search(params[:query])
    end

    # Additional logic for filtering
    if params[:category].present?
      @items = @items.where(category: params[:category])
    end

    if params[:color].present?
      @items = @items.where(color: params[:color])
    end

    # Determine the filtered category
    @filtered_category = params[:category]
    @filtered_color = params[:color]

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
      redirect_to items_path(@item), notice: "Item was successfully created, you can find it in your closet."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :brand, :category, :color, :original_price, :photo)
  end
end
