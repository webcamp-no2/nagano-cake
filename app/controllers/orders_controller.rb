class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @delivery = Delivery.new
  end

  def confirm
    @order = current_customer.orders.build(set_order)
    case params[:delivery_address_type]
    when "ご自身の住所"
      @order.zip_code = current_customer.zip_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    when "登録済住所から選択"
      @order.zip_code = Delivery.find(set_delivery[:id]).zip_code
      @order.delivery_address = Delivery.find(set_delivery[:id]).address
      @order.delivery_name = Delivery.find(set_delivery[:id]).name
    when "新しいお届け先"
    end
    @order.payment = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + @order.postage
    unless @order.valid?
      @delivery = Delivery.new
      render :new
    end
  end

  def create
     @order = current_customer.orders.build(set_order)
     if @order.save!
        # オーダー確定後ユーザーのカートを削除する
        current_customer.cart_items.destroy_all
     end
     redirect_to thanks_orders_path
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def set_order
    params.require(:order).permit(:payment, :payment_method, :delivery_address, :zip_code, :delivery_name)
  end
  def set_delivery
    params.require(:order).require(:delivery).permit(:id)
  end
end