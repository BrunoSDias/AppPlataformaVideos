require 'test_helper'

class Admin::AdministratorAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_administrator_address = admin_administrator_addresses(:one)
  end

  test "should get index" do
    get admin_administrator_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_administrator_address_url
    assert_response :success
  end

  test "should create admin_administrator_address" do
    assert_difference('Admin::AdministratorAddress.count') do
      post admin_administrator_addresses_url, params: { admin_administrator_address: { admin_administrators_id: @admin_administrator_address.admin_administrators_id, bairro: @admin_administrator_address.bairro, cep: @admin_administrator_address.cep, estado: @admin_administrator_address.estado, numero: @admin_administrator_address.numero, rua: @admin_administrator_address.rua } }
    end

    assert_redirected_to admin_administrator_address_url(Admin::AdministratorAddress.last)
  end

  test "should show admin_administrator_address" do
    get admin_administrator_address_url(@admin_administrator_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_administrator_address_url(@admin_administrator_address)
    assert_response :success
  end

  test "should update admin_administrator_address" do
    patch admin_administrator_address_url(@admin_administrator_address), params: { admin_administrator_address: { admin_administrators_id: @admin_administrator_address.admin_administrators_id, bairro: @admin_administrator_address.bairro, cep: @admin_administrator_address.cep, estado: @admin_administrator_address.estado, numero: @admin_administrator_address.numero, rua: @admin_administrator_address.rua } }
    assert_redirected_to admin_administrator_address_url(@admin_administrator_address)
  end

  test "should destroy admin_administrator_address" do
    assert_difference('Admin::AdministratorAddress.count', -1) do
      delete admin_administrator_address_url(@admin_administrator_address)
    end

    assert_redirected_to admin_administrator_addresses_url
  end
end
