require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product1 = products(:one)
    @product2 = products(:two)

    @valid_user = users(:valid_user)
  end

  test "should get show" do
    sign_in @valid_user
    get cart_url
    assert_response :success
  end

  test "should put add product to cart" do
    sign_in @valid_user
    #take product and add to chart
    assert_difference('@valid_user.cart_count') do
      put add_to_cart_url(@product1.id), xhr: true
    end
    assert_response :success
      #fire put request to cart#add

      #assert correct product set
      #assert success
  end

  test "should put remove from cart" do
  end
end
