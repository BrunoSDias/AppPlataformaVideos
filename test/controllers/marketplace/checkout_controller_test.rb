require 'test_helper'

class Marketplace::CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marketplace_checkout_index_url
    assert_response :success
  end

end
