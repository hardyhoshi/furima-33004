class OrdersController < ApplicationController

  def index
    @item_order = ItemOrder.new
  end

  def create
    binding.pry
  end
end
