class CustomersController < ApplicationController
  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def show
    @customer = Customer.find(current_customer.id)
  end

  def withdraw_confirm
  end

  def withdraw
  end
end
