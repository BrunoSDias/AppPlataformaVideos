require "application_system_test_case"

class Admin::AdministratorsTest < ApplicationSystemTestCase
  setup do
    @admin_administrator = admin_administrators(:one)
  end

  test "visiting the index" do
    visit admin_administrators_url
    assert_selector "h1", text: "Admin/Administrators"
  end

  test "creating a Administrator" do
    visit admin_administrators_url
    click_on "New Admin/Administrator"

    fill_in "Cpf", with: @admin_administrator.cpf
    fill_in "Nome", with: @admin_administrator.nome
    fill_in "Telefone", with: @admin_administrator.telefone
    click_on "Create Administrator"

    assert_text "Administrator was successfully created"
    click_on "Back"
  end

  test "updating a Administrator" do
    visit admin_administrators_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @admin_administrator.cpf
    fill_in "Nome", with: @admin_administrator.nome
    fill_in "Telefone", with: @admin_administrator.telefone
    click_on "Update Administrator"

    assert_text "Administrator was successfully updated"
    click_on "Back"
  end

  test "destroying a Administrator" do
    visit admin_administrators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Administrator was successfully destroyed"
  end
end
