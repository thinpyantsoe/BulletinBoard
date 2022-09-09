require "test_helper"

class PasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get edit_password" do
    get password_edit_password_url
    assert_response :success
  end
end
