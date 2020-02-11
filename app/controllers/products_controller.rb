class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(6).reverse_order
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
  end
end
