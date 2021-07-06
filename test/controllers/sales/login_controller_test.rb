require 'test_helper'

class Sales::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_login_index_url
    assert_response :success
  end

end
