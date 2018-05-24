require 'test_helper'

class Admin::ProductTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_admin = admins(:valid_admin)
    @product_type = product_types(:one)
  end

  test "should get index" do
    sign_in @valid_admin
    get admin_product_types_url
    assert_response :success
  end

  test "should get new" do
    sign_in @valid_admin
    get new_admin_product_type_url
    assert_response :success
  end

  test "should create product_type" do
    sign_in @valid_admin
    assert_difference('ProductType.count') do
      post admin_product_types_url, params: { product_type: { name: @product_type.name } }
    end

    assert_redirected_to admin_product_type_url(ProductType.last)
  end

  test "should show product_type" do
    sign_in @valid_admin
    get admin_product_type_url(@product_type)
    assert_response :success
  end

  test "should get edit" do
    sign_in @valid_admin
    get edit_admin_product_type_url(@product_type)
    assert_response :success
  end

  test "should update product_type" do
    sign_in @valid_admin
    patch admin_product_type_url(@product_type), params: { product_type: { name: @product_type.name } }
    assert_redirected_to admin_product_type_url(@product_type)
  end

  test "should destroy product_type" do
    sign_in @valid_admin
    assert_difference('ProductType.count', -1) do
      delete admin_product_type_url(@product_type)
    end

    assert_redirected_to admin_product_types_url
  end

  test "should redirect when not signed in" do
    get admin_product_types_url
    assert_redirected_to new_admin_session_url

    get new_admin_product_type_url
    assert_redirected_to new_admin_session_url

    assert_no_difference('ProductType.count') do
      post admin_product_types_url, params: { product_type: { name: @product_type.name } }
    end
    assert_redirected_to new_admin_session_url

    get admin_product_type_url(@product_type)
    assert_redirected_to new_admin_session_url

    get edit_admin_product_type_url(@product_type)
    assert_redirected_to new_admin_session_url

    patch admin_product_type_url(@product_type), params: { product_type: { name: @product_type.name } }
    assert_redirected_to new_admin_session_url

    assert_no_difference('ProductType.count', -1) do
      delete admin_product_type_url(@product_type)
    end
    assert_redirected_to new_admin_session_url
  end
end
