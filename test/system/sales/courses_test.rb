require "application_system_test_case"

class Sales::CoursesTest < ApplicationSystemTestCase
  setup do
    @sales_course = sales_courses(:one)
  end

  test "visiting the index" do
    visit sales_courses_url
    assert_selector "h1", text: "Sales/Courses"
  end

  test "creating a Course" do
    visit sales_courses_url
    click_on "New Sales/Course"

    fill_in "Descricao", with: @sales_course.descricao
    fill_in "Link", with: @sales_course.link
    fill_in "Nome", with: @sales_course.nome
    fill_in "Sales seller", with: @sales_course.sales_seller
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit sales_courses_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @sales_course.descricao
    fill_in "Link", with: @sales_course.link
    fill_in "Nome", with: @sales_course.nome
    fill_in "Sales seller", with: @sales_course.sales_seller
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit sales_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
