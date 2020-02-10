class Admin::OrdersController < Admin::BaseController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
  	redirect_to admin_order_path(order.id)
  end

  def show
  	@order = Order.find(params[:id])
  	@order_products = @order.order_products
  end

  private
	def order_params
		params.require(:order).permit(:status)
	end
end
