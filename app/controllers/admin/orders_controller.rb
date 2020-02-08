class Admin::OrdersController < Admin::BaseController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def update
  end

  def show
  end
end
