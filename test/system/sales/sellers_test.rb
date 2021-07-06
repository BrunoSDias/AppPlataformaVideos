require "application_system_test_case"

class Sales::SellersTest < ApplicationSystemTestCase
  setup do
    @sales_seller = sales_sellers(:one)
  end

  test "visiting the index" do
    visit sales_sellers_url
    assert_selector "h1", text: "Sales/Sellers"
  end

  test "creating a Seller" do
    visit sales_sellers_url
    click_on "New Sales/Seller"

    fill_in "Cpf", with: @sales_seller.cpf
    fill_in "Email", with: @sales_seller.email
    fill_in "Nome", with: @sales_seller.nome
    fill_in "Password digest", with: @sales_seller.password_digest
    fill_in "Telefone", with: @sales_seller.telefone
    click_on "Create Seller"

    assert_text "Seller was successfully created"
    click_on "Back"
  end

  test "updating a Seller" do
    visit sales_sellers_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @sales_seller.cpf
    fill_in "Email", with: @sales_seller.email
    fill_in "Nome", with: @sales_seller.nome
    fill_in "Password digest", with: @sales_seller.password_digest
    fill_in "Telefone", with: @sales_seller.telefone
    click_on "Update Seller"

    assert_text "Seller was successfully updated"
    click_on "Back"
  end

  test "destroying a Seller" do
    visit sales_sellers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seller was successfully destroyed"
  end
end
