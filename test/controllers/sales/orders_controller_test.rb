require 'test_helper'

class Sales::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_orders_index_url
    assert_response :success
  end

end
