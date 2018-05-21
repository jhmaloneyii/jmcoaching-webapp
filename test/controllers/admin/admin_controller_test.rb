require 'test_helper'

class Admin::AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_admin = admins(:valid_admin)
  end

  test "signed in admin should get admin home" do
    sign_in @valid_admin
    get admin_url
    assert_response :success
  end

  test "no admin should redirect" do
    get admin_url
    assert_response :redirect
  end
end
