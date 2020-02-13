class CartItemsController < ApplicationController
  def index
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
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :product_id, :count)
  end

end
