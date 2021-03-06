class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.all.order("created_at DESC").limit(4)
    @all_ranks = Product.find(OrderProduct.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
  end

  def about
  end
end
