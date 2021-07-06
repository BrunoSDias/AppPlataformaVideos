require "application_system_test_case"

class Sales::AddressesTest < ApplicationSystemTestCase
  setup do
    @sales_address = sales_addresses(:one)
  end

  test "visiting the index" do
    visit sales_addresses_url
    assert_selector "h1", text: "Sales/Addresses"
  end

  test "creating a Address" do
    visit sales_addresses_url
    click_on "New Sales/Address"

    fill_in "Bairro", with: @sales_address.bairro
    fill_in "Cep", with: @sales_address.cep
    fill_in "Estado", with: @sales_address.estado
    fill_in "Numero", with: @sales_address.numero
    fill_in "Rua", with: @sales_address.rua
    fill_in "Sales seller", with: @sales_address.sales_seller_id
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit sales_addresses_url
    click_on "Edit", match: :first

    fill_in "Bairro", with: @sales_address.bairro
    fill_in "Cep", with: @sales_address.cep
    fill_in "Estado", with: @sales_address.estado
    fill_in "Numero", with: @sales_address.numero
    fill_in "Rua", with: @sales_address.rua
    fill_in "Sales seller", with: @sales_address.sales_seller_id
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit sales_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
