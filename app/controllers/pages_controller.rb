class PagesController < ApplicationController

  def home
    if user_signed_in?
      @items = Item.where(category: "Dresses", user: current_user).limit(2)
      @outfits = Outfit.where(user: current_user).limit(2)
    else
      redirect_to landing_path
    end
  end

  def landing
  end
end
