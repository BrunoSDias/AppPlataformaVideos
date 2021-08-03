require 'test_helper'

class Client::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get client_courses_show_url
    assert_response :success
  end

end
