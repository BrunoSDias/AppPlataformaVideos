require 'test_helper'

class Sales::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_home_index_url
    assert_response :success
  end

end
