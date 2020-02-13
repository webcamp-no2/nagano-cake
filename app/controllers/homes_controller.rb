class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @products = Product.all.order("created_at DESC").limit(5)
  end

  def about
  end
end
