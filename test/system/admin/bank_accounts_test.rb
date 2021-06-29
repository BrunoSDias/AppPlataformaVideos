require "application_system_test_case"

class Admin::BankAccountsTest < ApplicationSystemTestCase
  setup do
    @admin_bank_account = admin_bank_accounts(:one)
  end

  test "visiting the index" do
    visit admin_bank_accounts_url
    assert_selector "h1", text: "Admin/Bank Accounts"
  end

  test "creating a Bank account" do
    visit admin_bank_accounts_url
    click_on "New Admin/Bank Account"

    fill_in "Admin administrator", with: @admin_bank_account.admin_administrator
    fill_in "Agencia", with: @admin_bank_account.agencia
    fill_in "Banco", with: @admin_bank_account.banco
    fill_in "Numero", with: @admin_bank_account.numero
    click_on "Create Bank account"

    assert_text "Bank account was successfully created"
    click_on "Back"
  end

  test "updating a Bank account" do
    visit admin_bank_accounts_url
    click_on "Edit", match: :first

    fill_in "Admin administrator", with: @admin_bank_account.admin_administrator
    fill_in "Agencia", with: @admin_bank_account.agencia
    fill_in "Banco", with: @admin_bank_account.banco
    fill_in "Numero", with: @admin_bank_account.numero
    click_on "Update Bank account"

    assert_text "Bank account was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank account" do
    visit admin_bank_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank account was successfully destroyed"
  end
end
