class Admin::OrdersController < Admin::BaseController
  def index
  	@orders = Order.page(params[:page]).reverse_order
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
    order = Order.find(params[:id])
    # 注文ステータス[入金確認]=>制作ステータス[製作待ち]
    if order.status == "入金確認"
      order.order_products.each do |order_product|
        order_product.update(production_status: "製作待ち")
      end
    end
    flash[:notice] = "You have updated status successfully."
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
