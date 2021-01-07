class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new(order_params)
  end
  
  def new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :street_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item =Item.find(params[:item_id])
    if (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
