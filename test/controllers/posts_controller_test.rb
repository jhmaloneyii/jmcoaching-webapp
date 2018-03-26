require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @admin = Admin.create(email: "example@test.com", password: "asdfasdf", username: "MrExample")
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_post_url
    assert_response :success
  end

  test "should redirect from new" do
    get new_post_url
    assert_response :redirect
  end

  test "should create post" do
    sign_in @admin
    assert_difference('Post.count') do
      post posts_url, params: { post: { active: @post.active, content: @post.content, image: @post.image, summary: @post.summary, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should redirect from create" do
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { active: @post.active, content: @post.content, image: @post.image, summary: @post.summary, title: @post.title } }
    end
    assert_response :redirect
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_post_url(@post)
    assert_response :success
  end

  test "should redirect from edit" do
    get edit_post_url(@post)
    assert_response :redirect
  end

  test "should update post" do
    sign_in @admin
    patch post_url(@post), params: { post: { active: @post.active, content: @post.content, image: @post.image, summary: @post.summary, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should redirect from update" do
    patch post_url(@post), params: { post: { active: @post.active, content: @post.content, image: @post.image, summary: @post.summary, title: @post.title } }
    assert_redirected_to new_admin_session_url
  end

  test "should destroy post" do
    sign_in @admin
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "should redirect from destroy post" do
    assert_no_difference('Post.count') do
      delete post_url(@post)
    end
    assert_redirected_to new_admin_session_url
  end

  test "should get admin_index" do
    sign_in @admin
    get blog_admin_url
    assert_response :success
  end

  test "should redirect away from admin_index" do
    get blog_admin_url
    assert_redirected_to new_admin_session_url
  end
end
