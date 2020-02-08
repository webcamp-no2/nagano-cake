class Admin::ProductsController < Admin::BaseController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end
end
