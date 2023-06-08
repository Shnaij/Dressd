class PagesController < ApplicationController
  def home
    @dresses = Item.where(category: 'dresses') # Replace with the appropriate code to retrieve dresses from the database
    @items = Item.joins(:photo_attachment)
  end

  def landing
  end

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

  # Categorize items for the view
  @dresses = @items.where(category: 'dresses')
  @tops = @items.where(category: 'tops')
  @bottoms = @items.where(category: 'bottoms')

  # Determine the filtered category
  @filtered_category = params[:category]

  # Filtered category headers
  @dresses_header = 'Dresses'
  @tops_header = 'Tops'
  @bottoms_header = 'Bottoms'
end

  def show
    @item = Item.find(params[:id])
  end
end
