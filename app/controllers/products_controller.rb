class ProductsController < ApplicationController
  def index
    if params[:genre_id].present?
      @products_of_genre = Product.where(genre_id: params[:genre_id])
      .page(params[:page]).per(6).reverse_order
    else
      @products_all = Product.page(params[:page]).per(18).reverse_order
    end
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
  end

end
