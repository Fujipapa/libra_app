require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get login_path
    assert_response :success
  end

end
