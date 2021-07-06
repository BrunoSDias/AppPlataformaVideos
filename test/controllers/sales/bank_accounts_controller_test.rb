require 'test_helper'

class Sales::BankAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_bank_account = sales_bank_accounts(:one)
  end

  test "should get index" do
    get sales_bank_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_bank_account_url
    assert_response :success
  end

  test "should create sales_bank_account" do
    assert_difference('Sales::BankAccount.count') do
      post sales_bank_accounts_url, params: { sales_bank_account: { agencia: @sales_bank_account.agencia, banco: @sales_bank_account.banco, conta: @sales_bank_account.conta, sales_seller_id: @sales_bank_account.sales_seller_id } }
    end

    assert_redirected_to sales_bank_account_url(Sales::BankAccount.last)
  end

  test "should show sales_bank_account" do
    get sales_bank_account_url(@sales_bank_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_bank_account_url(@sales_bank_account)
    assert_response :success
  end

  test "should update sales_bank_account" do
    patch sales_bank_account_url(@sales_bank_account), params: { sales_bank_account: { agencia: @sales_bank_account.agencia, banco: @sales_bank_account.banco, conta: @sales_bank_account.conta, sales_seller_id: @sales_bank_account.sales_seller_id } }
    assert_redirected_to sales_bank_account_url(@sales_bank_account)
  end

  test "should destroy sales_bank_account" do
    assert_difference('Sales::BankAccount.count', -1) do
      delete sales_bank_account_url(@sales_bank_account)
    end

    assert_redirected_to sales_bank_accounts_url
  end
end
