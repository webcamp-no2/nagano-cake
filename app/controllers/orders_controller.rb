class OrdersController < ApplicationController
  def index
    @customer = Customer.find(1)
  end

  def new
  end

  def confirm
    @order = Order.find(params[:id])
  end

  def create
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end
end

# @order = Order.new(order_params)
# render :new if @order.invalid?