class OrdersController < ApplicationController

  def index
    @item_order = ItemOrder.new
  end

end
