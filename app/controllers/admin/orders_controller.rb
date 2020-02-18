class Admin::OrdersController < Admin::BaseController
  def index
    request_referer = Rails.application.routes.recognize_path(request.referer)
    request_referer_controller = request_referer[:controller]
    request_referer_action = request_referer[:action]

    if request_referer_controller == "admin/homes" && request_referer_action == "top"
      # トップページからの遷移 → 今日のオーダーを表示
      @orders = Order.where("created_at >= ?", Date.today).page(params[:page]).reverse_order
    elsif request_referer_controller == "admin/customers" && request_referer_action == "show"
      # 会員詳細からの遷移 ⇨ その会員のオーダーを表示
      @orders = Order.where('customer_id = ?', request_referer[:id]).page(params[:page]).reverse_order
    else
      # 全てのオーダーを表示
      @orders = Order.page(params[:page]).reverse_order
    end
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
