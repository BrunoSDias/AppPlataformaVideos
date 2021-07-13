require 'test_helper'

class Client::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_home_index_url
    assert_response :success
  end

end
