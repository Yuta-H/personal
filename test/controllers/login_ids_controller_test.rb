require 'test_helper'

class LoginIdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @login_id = login_ids(:one)
  end

  test "should get index" do
    get login_ids_url
    assert_response :success
  end

  test "should get new" do
    get new_login_id_url
    assert_response :success
  end

  test "should create login_id" do
    assert_difference('LoginId.count') do
      post login_ids_url, params: { login_id: { authenticate_key: @login_id.authenticate_key, secret_id: @login_id.secret_id } }
    end

    assert_redirected_to login_id_url(LoginId.last)
  end

  test "should show login_id" do
    get login_id_url(@login_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_login_id_url(@login_id)
    assert_response :success
  end

  test "should update login_id" do
    patch login_id_url(@login_id), params: { login_id: { authenticate_key: @login_id.authenticate_key, secret_id: @login_id.secret_id } }
    assert_redirected_to login_id_url(@login_id)
  end

  test "should destroy login_id" do
    assert_difference('LoginId.count', -1) do
      delete login_id_url(@login_id)
    end

    assert_redirected_to login_ids_url
  end
end
