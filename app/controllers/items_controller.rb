class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :item_name, :text, :category_id, :item_state_id, :shipping_cost_bearer_id, :prefectures_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

end
