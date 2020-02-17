class ProductsController < ApplicationController
  def index
    if params[:genre_id].present?
      @products = Product.where(genre_id: params[:genre_id])
      .page(params[:page]).per(18).reverse_order

      @product_genre = @products.first.genre if @products.count > 0
    else
      # ジャンルが無効になっている商品は一覧に表示しない
      @products = Product
        .joins(:genre).where(genres: {active_status: "有効"})
        .page(params[:page]).per(18).reverse_order
    end
    @genres = Genre.all
  end

  def search
    # application controllerで生成した@qを利用して検索する
    @q_products = @q.result.page(params[:page]).per(18).reverse_order
    @genres = Genre.all

    render :index
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
  end

end
