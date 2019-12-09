require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = users(:michael)
    end

    test "login with valid information" do
        get login_path
        post login_path, params: {email: @user.email,
                                    password: 'password',
                                    password_confirmation: 'password'}
        assert_redirected_to books_path
        follow_redirect!
        assert_template 'books/index'
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", books_path
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", me_path
    end
end