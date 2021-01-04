class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item =Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end
  
  def create
    @item_order = ItemOrder.new(order_params)
    binding.pry
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    # else
      # render action: :new
    end
  end

  private

  def order_params
    params.permit(:number, :exp_month, :exp_year, :cvc, :postal_code, :prefecture_id, :municipality, :street_number, :building_name, :phone_number)
  end

  def move_to_index
    @item =Item.find(params[:item_id])
    if (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end
end
