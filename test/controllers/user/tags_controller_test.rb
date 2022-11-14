require "test_helper"

class User::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_tags_new_url
    assert_response :success
  end

  test "should get create" do
    get user_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_tags_destroy_url
    assert_response :success
  end
end
