require 'test_helper'

class Admin::BankAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_bank_account = admin_bank_accounts(:one)
  end

  test "should get index" do
    get admin_bank_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_bank_account_url
    assert_response :success
  end

  test "should create admin_bank_account" do
    assert_difference('Admin::BankAccount.count') do
      post admin_bank_accounts_url, params: { admin_bank_account: { admin_administrator: @admin_bank_account.admin_administrator, agencia: @admin_bank_account.agencia, banco: @admin_bank_account.banco, numero: @admin_bank_account.numero } }
    end

    assert_redirected_to admin_bank_account_url(Admin::BankAccount.last)
  end

  test "should show admin_bank_account" do
    get admin_bank_account_url(@admin_bank_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_bank_account_url(@admin_bank_account)
    assert_response :success
  end

  test "should update admin_bank_account" do
    patch admin_bank_account_url(@admin_bank_account), params: { admin_bank_account: { admin_administrator: @admin_bank_account.admin_administrator, agencia: @admin_bank_account.agencia, banco: @admin_bank_account.banco, numero: @admin_bank_account.numero } }
    assert_redirected_to admin_bank_account_url(@admin_bank_account)
  end

  test "should destroy admin_bank_account" do
    assert_difference('Admin::BankAccount.count', -1) do
      delete admin_bank_account_url(@admin_bank_account)
    end

    assert_redirected_to admin_bank_accounts_url
  end
end
