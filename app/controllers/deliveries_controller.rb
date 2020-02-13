class DeliveriesController < ApplicationController
  def index
    @delivery_address = Delivery.new
    @customer = Customer.find(current_customer.id)
  end

  def create
    @delivery_address = Delivery.new(delivery_params)
    @delivery_address.customer_id = current_customer.id
    if @delivery_address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to deliveries_path
    else
      @customer = Customer.find(current_customer.id)
      render action: :index
    end
  end

  def edit
    @delivery_address = Delivery.find(params[:id])
  end

  def update
    @delivery_address = Delivery.find(params[:id])
    if @delivery_address.update(delivery_params)
      flash[:notice] = "配送先を編集しました。"
      redirect_to deliveries_path
    else
      render action: :edit
    end
  end

  def destroy
  end

  private
  def delivery_params
    params.require(:delivery).permit(:name, :zip_code, :address)
  end
end
