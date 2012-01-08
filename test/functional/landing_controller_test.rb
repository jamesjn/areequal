require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  test "get index" do
    get :index
    assert_response :success
  end
end
