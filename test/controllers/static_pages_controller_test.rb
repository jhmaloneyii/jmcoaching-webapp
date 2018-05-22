require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get athletes" do
    get athletes_url
    assert_response :success
  end

  test "should get coach" do
    get coach_url
    assert_response :success
  end

end
