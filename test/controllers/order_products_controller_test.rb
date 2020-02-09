require 'test_helper'

class OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get order_products_update_url
    assert_response :success
  end

end
