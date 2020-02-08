class Admin::OrdersController < Admin::BaseController
  def index
  	@orders = Order.all
  end

  def update
  end

  def show
  end
end
