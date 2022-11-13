require "test_helper"

class User::FavouritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_favourites_index_url
    assert_response :success
  end

  test "should get destroy" do
    get user_favourites_destroy_url
    assert_response :success
  end
end
