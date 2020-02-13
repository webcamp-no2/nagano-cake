class DeliveriesController < ApplicationController
  def create
  end

  def edit
    @delivery_address = Delivery.find(params[:id])
  end

  def update
  end

  def index
    @delivery_address = Delivery.new
    @customer = Customer.find(current_customer.id)
  end

  def destroy
  end
end
