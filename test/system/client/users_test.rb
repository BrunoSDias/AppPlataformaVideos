require "application_system_test_case"

class Client::UsersTest < ApplicationSystemTestCase
  setup do
    @client_user = client_users(:one)
  end

  test "visiting the index" do
    visit client_users_url
    assert_selector "h1", text: "Client/Users"
  end

  test "creating a User" do
    visit client_users_url
    click_on "New Client/User"

    fill_in "Cpf", with: @client_user.cpf
    fill_in "Email", with: @client_user.email
    fill_in "Nome", with: @client_user.nome
    fill_in "Password digest", with: @client_user.password_digest
    fill_in "Telefone", with: @client_user.telefone
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit client_users_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @client_user.cpf
    fill_in "Email", with: @client_user.email
    fill_in "Nome", with: @client_user.nome
    fill_in "Password digest", with: @client_user.password_digest
    fill_in "Telefone", with: @client_user.telefone
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit client_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
