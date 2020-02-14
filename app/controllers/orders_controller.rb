class OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(params[:id])
  end

  def create
    @order = Order.new(params[:id])
    @order.save
    redirect_to order_path
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end
end
