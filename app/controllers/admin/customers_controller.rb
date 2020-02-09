class Admin::CustomersController < Admin::BaseController
  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  def show
  end
end
