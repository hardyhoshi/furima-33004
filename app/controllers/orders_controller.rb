class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item =Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture, :municipality, :street_number, :building_name, :phone_number)
  end

  def move_to_index
    @item =Item.find(params[:item_id])
    if (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end
end
