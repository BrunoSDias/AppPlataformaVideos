require 'test_helper'

class Sales::YoutubeControllerTest < ActionDispatch::IntegrationTest
  test "should get redirect" do
    get sales_youtube_redirect_url
    assert_response :success
  end

end
