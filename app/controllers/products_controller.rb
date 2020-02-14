class ProductsController < ApplicationController
  def index
    @products_of_genre = 
        Product.where(genre_id: params[:genre_id])
        .page(params[:page]).per(6).reverse_order
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
  end
end
