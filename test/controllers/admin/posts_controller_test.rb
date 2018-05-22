require 'test_helper'

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
  @valid_admin = admins(:valid_admin)
  @post1 = posts(:one)
  @post2 = posts(:two)
  end

  test "should get new" do
    sign_in @valid_admin
    get new_admin_post_url
    assert_response :success
  end

  test "should redirect from new" do
    get new_admin_post_url
    assert_response :redirect
  end

  test "should create post" do
    sign_in @valid_admin
    assert_difference('Post.count') do
      post admin_posts_url, params: { post: { title: "Created Post" , content: "This post was created through a test" , suammry: "test create" , active: true} }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should redirect from create" do
    assert_no_difference('Post.count') do
      post admin_posts_url, params: { post: { title: "Created Post" , content: "This post was created through a test" , suammry: "test create" , active: true} }
    end
    assert_response :redirect
  end

  test "should get edit" do
    sign_in @valid_admin
    get edit_admin_post_url(@post1)
    assert_response :success
  end

  test "should redirect from edit" do
    get edit_admin_post_url(@post1)
    assert_response :redirect
  end

  test "should update post" do
    sign_in @valid_admin
    patch admin_post_url(@post1), params: { post: { title: "Updated Post" , content: "This post was updated through a test" , suammry: "test update" , active: true} }
    assert_redirected_to post_url(@post1)
  end

  test "should redirect from update" do
    patch admin_post_url(@post1), params: { post: { title: "Updated Post" , content: "This post was updated through a test" , suammry: "test update" , active: true} }
    assert_redirected_to new_admin_session_url
  end

  test "should destroy post" do
    sign_in @valid_admin
    assert_difference('Post.count', -1) do
      delete admin_post_url(@post1)
    end

    assert_redirected_to admin_posts_url
  end

  test "should redirect from destroy post" do
    assert_no_difference('Post.count') do
      delete admin_post_url(@post2)
    end
    assert_redirected_to new_admin_session_url
  end

  test "should get admin blog index panel" do
    sign_in @valid_admin
    get admin_posts_url
    assert_response :success
  end

  test "should redirect away from admin blog index when not signed in" do
    get admin_posts_url
    assert_response :redirect
  end
end
