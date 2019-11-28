require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:michael)
    end

    test "home with valid information" do
        get login_path
        post login_path, params: {email: @user.email,
                                    password: 'password'}
        assert_redirected_to root_url
        follow_redirect!
        assert_template 'home/top'
        assert_select "a[href=?]", books_path
    end
end