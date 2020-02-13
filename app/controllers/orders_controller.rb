class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def confirm
  end

  def create
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end
end
