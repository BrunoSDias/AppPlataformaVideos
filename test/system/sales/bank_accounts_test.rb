require "application_system_test_case"

class Sales::BankAccountsTest < ApplicationSystemTestCase
  setup do
    @sales_bank_account = sales_bank_accounts(:one)
  end

  test "visiting the index" do
    visit sales_bank_accounts_url
    assert_selector "h1", text: "Sales/Bank Accounts"
  end

  test "creating a Bank account" do
    visit sales_bank_accounts_url
    click_on "New Sales/Bank Account"

    fill_in "Agencia", with: @sales_bank_account.agencia
    fill_in "Banco", with: @sales_bank_account.banco
    fill_in "Conta", with: @sales_bank_account.conta
    fill_in "Sales seller", with: @sales_bank_account.sales_seller_id
    click_on "Create Bank account"

    assert_text "Bank account was successfully created"
    click_on "Back"
  end

  test "updating a Bank account" do
    visit sales_bank_accounts_url
    click_on "Edit", match: :first

    fill_in "Agencia", with: @sales_bank_account.agencia
    fill_in "Banco", with: @sales_bank_account.banco
    fill_in "Conta", with: @sales_bank_account.conta
    fill_in "Sales seller", with: @sales_bank_account.sales_seller_id
    click_on "Update Bank account"

    assert_text "Bank account was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank account" do
    visit sales_bank_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank account was successfully destroyed"
  end
end
