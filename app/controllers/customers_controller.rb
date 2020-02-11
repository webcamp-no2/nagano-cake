class CustomersController < ApplicationController
  def edit
    @customer = Customer.find(1) # TODO: sessionから取得する
  end

  def update
  end

  def show
    @customer = Customer.find(1) # TODO: sessionから取得する
  end

  def withdraw_confirm
  end

  def withdraw
  end
end
