require 'test_helper'

class MyDropboxControllerTest < ActionController::TestCase
  test "should get my_pages" do
    get :my_pages
    assert_response :success
  end

  test "should get edit_page" do
    get :edit_page
    assert_response :success
  end

end
