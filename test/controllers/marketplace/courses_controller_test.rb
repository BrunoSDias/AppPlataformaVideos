require 'test_helper'

class Marketplace::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get marketplace_courses_show_url
    assert_response :success
  end

end
