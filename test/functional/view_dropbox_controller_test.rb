require 'test_helper'

class ViewDropboxControllerTest < ActionController::TestCase
  test "should get view_page" do
    get :view_page
    assert_response :success
  end

end
