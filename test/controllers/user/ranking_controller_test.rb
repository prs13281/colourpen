require "test_helper"

class User::RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_ranking_index_url
    assert_response :success
  end
end
