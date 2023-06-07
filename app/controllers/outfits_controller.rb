class OutfitsController < ApplicationController
  def index
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
