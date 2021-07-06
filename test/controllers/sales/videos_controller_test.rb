require 'test_helper'

class Sales::VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_video = sales_videos(:one)
  end

  test "should get index" do
    get sales_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_video_url
    assert_response :success
  end

  test "should create sales_video" do
    assert_difference('Sales::Video.count') do
      post sales_videos_url, params: { sales_video: { descricao: @sales_video.descricao, link: @sales_video.link, nome: @sales_video.nome, sales_course_id: @sales_video.sales_course_id } }
    end

    assert_redirected_to sales_video_url(Sales::Video.last)
  end

  test "should show sales_video" do
    get sales_video_url(@sales_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_video_url(@sales_video)
    assert_response :success
  end

  test "should update sales_video" do
    patch sales_video_url(@sales_video), params: { sales_video: { descricao: @sales_video.descricao, link: @sales_video.link, nome: @sales_video.nome, sales_course_id: @sales_video.sales_course_id } }
    assert_redirected_to sales_video_url(@sales_video)
  end

  test "should destroy sales_video" do
    assert_difference('Sales::Video.count', -1) do
      delete sales_video_url(@sales_video)
    end

    assert_redirected_to sales_videos_url
  end
end
