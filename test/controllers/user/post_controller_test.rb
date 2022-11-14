require "test_helper"

class User::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_post_new_url
    assert_response :success
  end

  test "should get index" do
    get user_post_index_url
    assert_response :success
  end

  test "should get create" do
    get user_post_create_url
    assert_response :success
  end

  test "should get show" do
    get user_post_show_url
    assert_response :success
  end

  test "should get update" do
    get user_post_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_post_destroy_url
    assert_response :success
  end
end
