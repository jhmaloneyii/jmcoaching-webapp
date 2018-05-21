require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get show" do
    get tag_url(@tag)
    assert_response :success
  end
end
