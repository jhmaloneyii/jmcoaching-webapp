require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
    @admin = Admin.create(email: "example@test.com", password: "asdfasdf", username: "MrExample")
  end

  test "should get index" do
    sign_in @admin
    get tags_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    sign_in @admin
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { name: @tag.name } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should show tag" do
    sign_in @admin
    get tag_url(@tag)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    sign_in @admin
    patch tag_url(@tag), params: { tag: { name: @tag.name } }
    assert_redirected_to tag_url(@tag)
  end

  test "should destroy tag" do
    sign_in @admin
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end

  test "should redirect from all except show" do
    get tags_url
    assert_redirected_to new_admin_session_url

    get new_tag_url
    assert_redirected_to new_admin_session_url

    assert_no_difference('Tag.count') do
      post tags_url, params: { tag: { name: @tag.name } }
    end
    assert_redirected_to new_admin_session_url

    get edit_tag_url(@tag)
    assert_redirected_to new_admin_session_url

    patch tag_url(@tag), params: { tag: { name: @tag.name } }
    assert_redirected_to new_admin_session_url

    assert_no_difference('Tag.count') do
      delete tag_url(@tag)
    end
    assert_redirected_to new_admin_session_url
  end
end
