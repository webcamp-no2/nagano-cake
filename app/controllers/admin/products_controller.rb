class Admin::ProductsController < Admin::BaseController

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id), notice:'商品を作成しました'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id), notice:'商品情報を更新しました'
    else
      render 'edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :image, :description, :price, :sales_status)
  end
end
