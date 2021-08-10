require 'test_helper'

class Client::VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get client_videos_show_url
    assert_response :success
  end

end
