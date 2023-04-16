require "test_helper"

class AuthTokenControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get auth_token_generate_url
    assert_response :success
  end
end
