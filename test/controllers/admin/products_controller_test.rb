require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_admin = admins(:valid_admin)
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test "should get index" do
    sign_in @valid_admin

    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    sign_in @valid_admin

    get new_admin_product_url
    assert_response :success
  end

  test "should create product" do
    sign_in @valid_admin

    assert_difference('Product.count') do
      post admin_products_url, params: { product: { name: "Created Product", price: 14.99, description: "This product was created" } }
    end
    assert_redirect_to admin_product_url(Product.last)
  end

  test "should get edit" do
    sign_in @valid_admin

    get edit_admin_product_url(@product1)
    assert_response :success
  end

  test "should update product" do
    sign_in @valid_admin

    assert_difference('Product.count') do
      patch admin_product_url(@product1), params: { product: {name: "Updated Product", price: 29.99, description: "This product was updated "} }
    end
    assert_redirected_to admin_product_url(@product1)
  end

  test "should destroy product" do
    sign_in @valid_admin

    assert_difference('Product.count', -1) do
      delete admin_product_url(@product2)
    end
    assert_redirected_to admin_products_url
  end

  test "should redirect from all when not logged in" do
    get admin_products_url
    assert_redirected_to new_admin_session_url

    get new_admin_product_url
    assert_redirected_to new_admin_session_url

    assert_no_difference('Product.count') do
      post admin_products_url, params: { product: { name: "Created Product", price: 14.99, description: "This product was created" } }
    end
    assert_redirected_to new_admin_session_url

    get edit_admin_product_url(@product1)
    assert_redirected_to new_admin_session_url

    assert_no_difference('Product.count') do
      patch admin_product_url(@product1), params: { product: {name: "Updated Product", price: 29.99, description: "This product was updated "} }
    end
    assert_redirected_to new_admin_session_url

    assert_no_difference('Product.count') do
      delete admin_product_url(@product1)
    end
    assert_redirected_to new_admin_session_url
  end
end
