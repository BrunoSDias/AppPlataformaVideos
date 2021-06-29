require "application_system_test_case"

class Admin::AdministratorAddressesTest < ApplicationSystemTestCase
  setup do
    @admin_administrator_address = admin_administrator_addresses(:one)
  end

  test "visiting the index" do
    visit admin_administrator_addresses_url
    assert_selector "h1", text: "Admin/Administrator Addresses"
  end

  test "creating a Administrator address" do
    visit admin_administrator_addresses_url
    click_on "New Admin/Administrator Address"

    fill_in "Admin administrators", with: @admin_administrator_address.admin_administrators_id
    fill_in "Bairro", with: @admin_administrator_address.bairro
    fill_in "Cep", with: @admin_administrator_address.cep
    fill_in "Estado", with: @admin_administrator_address.estado
    fill_in "Numero", with: @admin_administrator_address.numero
    fill_in "Rua", with: @admin_administrator_address.rua
    click_on "Create Administrator address"

    assert_text "Administrator address was successfully created"
    click_on "Back"
  end

  test "updating a Administrator address" do
    visit admin_administrator_addresses_url
    click_on "Edit", match: :first

    fill_in "Admin administrators", with: @admin_administrator_address.admin_administrators_id
    fill_in "Bairro", with: @admin_administrator_address.bairro
    fill_in "Cep", with: @admin_administrator_address.cep
    fill_in "Estado", with: @admin_administrator_address.estado
    fill_in "Numero", with: @admin_administrator_address.numero
    fill_in "Rua", with: @admin_administrator_address.rua
    click_on "Update Administrator address"

    assert_text "Administrator address was successfully updated"
    click_on "Back"
  end

  test "destroying a Administrator address" do
    visit admin_administrator_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Administrator address was successfully destroyed"
  end
end
