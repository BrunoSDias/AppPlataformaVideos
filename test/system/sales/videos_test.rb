require "application_system_test_case"

class Sales::VideosTest < ApplicationSystemTestCase
  setup do
    @sales_video = sales_videos(:one)
  end

  test "visiting the index" do
    visit sales_videos_url
    assert_selector "h1", text: "Sales/Videos"
  end

  test "creating a Video" do
    visit sales_videos_url
    click_on "New Sales/Video"

    fill_in "Descricao", with: @sales_video.descricao
    fill_in "Link", with: @sales_video.link
    fill_in "Nome", with: @sales_video.nome
    fill_in "Sales course", with: @sales_video.sales_course_id
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "updating a Video" do
    visit sales_videos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @sales_video.descricao
    fill_in "Link", with: @sales_video.link
    fill_in "Nome", with: @sales_video.nome
    fill_in "Sales course", with: @sales_video.sales_course_id
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "destroying a Video" do
    visit sales_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video was successfully destroyed"
  end
end
