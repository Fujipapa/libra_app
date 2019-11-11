require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(email: "Example@example.com", password: "Example", role: 1)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password shoule be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "role should be present" do
    @user.password = nil 
    assert_not @user.valid?
  end
  
end
