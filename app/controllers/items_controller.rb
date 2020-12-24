class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :item_status_id, :shipping_charge_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
