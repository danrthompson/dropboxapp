require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get uploading_files" do
    get :uploading_files
    assert_response :success
  end

end
