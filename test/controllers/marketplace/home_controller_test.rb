require 'test_helper'

class Marketplace::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get marketplace_home_index_url
    assert_response :success
  end

end
