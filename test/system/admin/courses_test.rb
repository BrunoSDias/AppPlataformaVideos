require "application_system_test_case"

class Admin::CoursesTest < ApplicationSystemTestCase
  setup do
    @admin_course = admin_courses(:one)
  end

  test "visiting the index" do
    visit admin_courses_url
    assert_selector "h1", text: "Admin/Courses"
  end

  test "creating a Course" do
    visit admin_courses_url
    click_on "New Admin/Course"

    fill_in "Descricao", with: @admin_course.descricao
    fill_in "Link", with: @admin_course.link
    fill_in "Nome", with: @admin_course.nome
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit admin_courses_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @admin_course.descricao
    fill_in "Link", with: @admin_course.link
    fill_in "Nome", with: @admin_course.nome
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit admin_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
