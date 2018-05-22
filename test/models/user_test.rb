require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @valid_user = users(:valid_user)
  end

  test "should get cart count" do
    p @valid_user.cart_count
    assert @valid_user.cart_count
  end
end
