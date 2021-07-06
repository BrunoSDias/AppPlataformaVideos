require 'test_helper'

class Sales::SellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_seller = sales_sellers(:one)
  end

  test "should get index" do
    get sales_sellers_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_seller_url
    assert_response :success
  end

  test "should create sales_seller" do
    assert_difference('Sales::Seller.count') do
      post sales_sellers_url, params: { sales_seller: { cpf: @sales_seller.cpf, email: @sales_seller.email, nome: @sales_seller.nome, password_digest: @sales_seller.password_digest, telefone: @sales_seller.telefone } }
    end

    assert_redirected_to sales_seller_url(Sales::Seller.last)
  end

  test "should show sales_seller" do
    get sales_seller_url(@sales_seller)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_seller_url(@sales_seller)
    assert_response :success
  end

  test "should update sales_seller" do
    patch sales_seller_url(@sales_seller), params: { sales_seller: { cpf: @sales_seller.cpf, email: @sales_seller.email, nome: @sales_seller.nome, password_digest: @sales_seller.password_digest, telefone: @sales_seller.telefone } }
    assert_redirected_to sales_seller_url(@sales_seller)
  end

  test "should destroy sales_seller" do
    assert_difference('Sales::Seller.count', -1) do
      delete sales_seller_url(@sales_seller)
    end

    assert_redirected_to sales_sellers_url
  end
end
