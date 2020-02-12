class CartItemsController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
