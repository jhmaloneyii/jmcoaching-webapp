require 'test_helper'

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_admin = admins(:valid_admin)
    @tag1 = tags(:one)
    @tag2 = tags(:two)
  end

  test "should get admin index" do
    sign_in @valid_admin
    get admin_tags_url
    assert_response :success
  end

  test "should get new" do
    sign_in @valid_admin
    get new_admin_tag_url
    assert_response :success
  end

  test "should create tag" do
    sign_in @valid_admin
    assert_difference('Tag.count') do
      post admin_tags_url, params: { tag: { name: "Created Tag" } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should get edit" do
    sign_in @valid_admin
    get edit_admin_tag_url(@tag1)
    assert_response :success
  end

  test "should update tag" do
    sign_in @valid_admin
    patch admin_tag_url(@tag1), params: { tag: { name: "Updated Tag" } }
    assert_redirected_to tag_url(@tag1)
  end

  test "should destroy tag" do
    sign_in @valid_admin
    assert_difference('Tag.count', -1) do
      delete admin_tag_url(@tag2)
    end

    assert_redirected_to admin_tags_url
  end

  test "should redirect from all except show" do
    get admin_tags_url
    assert_redirected_to new_admin_session_url

    get new_admin_tag_url
    assert_redirected_to new_admin_session_url

    assert_no_difference('Tag.count') do
      post admin_tags_url, params: { tag: { name: "Don't Create Tag" } }
    end
    assert_redirected_to new_admin_session_url

    get edit_admin_tag_url(@tag1)
    assert_redirected_to new_admin_session_url

    patch admin_tag_url(@tag1), params: { tag: { name: "Don't Update Tag" } }
    assert_redirected_to new_admin_session_url

    assert_no_difference('Tag.count') do
      delete admin_tag_url(@tag1)
    end
    assert_redirected_to new_admin_session_url
  end
end
