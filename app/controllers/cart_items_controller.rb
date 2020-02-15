class CartItemsController < ApplicationController
  def index
    @customer = Customer.find(current_customer.id)
  end

  def create
    @product = Product.find(params[:product_id])
    @cart_item = @product.cart_items.build(count: cart_item_params[:count],customer_id:current_customer.id)
    if @cart_item.save
      redirect_to product_cart_items_path
    end
  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = "カート内の商品を削除しました。"
      redirect_to cart_items_path
    else
      render action: :index
    end
  end

  def destroy_all
    customer = Customer.find(current_customer.id)
    if customer.cart_items.destroy_all
      flash[:notice] = "カート内の商品を全て削除しました。"
      redirect_to cart_items_path
    else
      render action: :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :count)
  end

end
