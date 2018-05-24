require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @valid_user = users(:valid_user)
    $redis.sadd "cart#{@valid_user.id}", 1
    $redis.sadd "cart#{@valid_user.id}", 2
    $redis.sadd "cart#{@valid_user.id}", 3
  end

  test "should get cart count" do
    assert @valid_user.cart_count
  end

  test "should empty cart" do
    assert @valid_user.empty_cart
    assert_equal 0, @valid_user.cart_count
  end
end
