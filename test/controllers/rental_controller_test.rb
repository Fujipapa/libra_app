require 'test_helper'

class RentalControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get rental_search_url
    assert_response :success
  end

  test "should get detail" do
    get rental_detail_url
    assert_response :success
  end

  test "should get rental" do
    get rental_rental_url
    assert_response :success
  end

end
