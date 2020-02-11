class OrdersController < ApplicationController
  def index
    @customer = Customer.find(current_customer)
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
  end
end
