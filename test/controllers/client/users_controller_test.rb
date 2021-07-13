require 'test_helper'

class Client::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_user = client_users(:one)
  end

  test "should get index" do
    get client_users_url
    assert_response :success
  end

  test "should get new" do
    get new_client_user_url
    assert_response :success
  end

  test "should create client_user" do
    assert_difference('Client::User.count') do
      post client_users_url, params: { client_user: { cpf: @client_user.cpf, email: @client_user.email, nome: @client_user.nome, password_digest: @client_user.password_digest, telefone: @client_user.telefone } }
    end

    assert_redirected_to client_user_url(Client::User.last)
  end

  test "should show client_user" do
    get client_user_url(@client_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_user_url(@client_user)
    assert_response :success
  end

  test "should update client_user" do
    patch client_user_url(@client_user), params: { client_user: { cpf: @client_user.cpf, email: @client_user.email, nome: @client_user.nome, password_digest: @client_user.password_digest, telefone: @client_user.telefone } }
    assert_redirected_to client_user_url(@client_user)
  end

  test "should destroy client_user" do
    assert_difference('Client::User.count', -1) do
      delete client_user_url(@client_user)
    end

    assert_redirected_to client_users_url
  end
end
