class ProductsController < ApplicationController
  def index
    @products_of_genre = 
        Product.where(genre_id: params[:genre_id])
        .page(params[:page]).per(6).reverse_order
    @genres = Genre.all
  end

  def search
    # application controllerで生成した@qを利用して検索する
    @q_products = @q.result.page(params[:page]).per(6).reverse_order
    @genres = Genre.all

    render :index
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
  end
end
