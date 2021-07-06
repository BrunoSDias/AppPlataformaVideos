require 'test_helper'

class Sales::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_course = sales_courses(:one)
  end

  test "should get index" do
    get sales_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_course_url
    assert_response :success
  end

  test "should create sales_course" do
    assert_difference('Sales::Course.count') do
      post sales_courses_url, params: { sales_course: { descricao: @sales_course.descricao, link: @sales_course.link, nome: @sales_course.nome, sales_seller: @sales_course.sales_seller } }
    end

    assert_redirected_to sales_course_url(Sales::Course.last)
  end

  test "should show sales_course" do
    get sales_course_url(@sales_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_course_url(@sales_course)
    assert_response :success
  end

  test "should update sales_course" do
    patch sales_course_url(@sales_course), params: { sales_course: { descricao: @sales_course.descricao, link: @sales_course.link, nome: @sales_course.nome, sales_seller: @sales_course.sales_seller } }
    assert_redirected_to sales_course_url(@sales_course)
  end

  test "should destroy sales_course" do
    assert_difference('Sales::Course.count', -1) do
      delete sales_course_url(@sales_course)
    end

    assert_redirected_to sales_courses_url
  end
end
