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
    @customer = Customer.find(current_customer.id)
    if @customer.update!(admittion_status: "withdraw")
      
      redirect_to customers_sign_out_path
    end
  end
end
