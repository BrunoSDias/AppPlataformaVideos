require 'test_helper'

class Sales::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_address = sales_addresses(:one)
  end

  test "should get index" do
    get sales_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_address_url
    assert_response :success
  end

  test "should create sales_address" do
    assert_difference('Sales::Address.count') do
      post sales_addresses_url, params: { sales_address: { bairro: @sales_address.bairro, cep: @sales_address.cep, estado: @sales_address.estado, numero: @sales_address.numero, rua: @sales_address.rua, sales_seller_id: @sales_address.sales_seller_id } }
    end

    assert_redirected_to sales_address_url(Sales::Address.last)
  end

  test "should show sales_address" do
    get sales_address_url(@sales_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_address_url(@sales_address)
    assert_response :success
  end

  test "should update sales_address" do
    patch sales_address_url(@sales_address), params: { sales_address: { bairro: @sales_address.bairro, cep: @sales_address.cep, estado: @sales_address.estado, numero: @sales_address.numero, rua: @sales_address.rua, sales_seller_id: @sales_address.sales_seller_id } }
    assert_redirected_to sales_address_url(@sales_address)
  end

  test "should destroy sales_address" do
    assert_difference('Sales::Address.count', -1) do
      delete sales_address_url(@sales_address)
    end

    assert_redirected_to sales_addresses_url
  end
end
