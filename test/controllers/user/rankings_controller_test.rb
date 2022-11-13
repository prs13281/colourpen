require "test_helper"

class User::RankingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_rankings_index_url
    assert_response :success
  end
end
