class ItemsController < ApplicationController
  def index
    @items = Item.all

    # Search results
    if params[:query].present?
      @items = Item.search_by_five_columns(params[:query])
    else
      @items = Item.all
    end

    # Additional logic for filtering
    if params[:category].present?
      @items = @items.where(category: params[:category])
    end

    # Additional logic for sorting
    if params[:sort] == 'price_asc'
      @items = @items.order(price: :asc)
    elsif params[:sort] == 'price_desc'
      @items = @items.order(price: :desc)
    end

    # Determine the filtered category
    @filtered_category = params[:category]

    # Filtered category headers
    @dresses_header = 'Dresses'
    @tops_header = 'Tops'
    @bottoms_header = 'Bottoms'

    # Categorize items for the view
    @shoes = Item.where(category: "shoes")
    @dresses = Item.where(category: "dresses")
    @tops = Item.where(category: "tops")
    @bottoms = Item.where(category: "bottoms")
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
