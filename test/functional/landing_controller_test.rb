require 'test_helper'

class LandingControllerTest < ActionController::TestCase
  test "Landing page index get" do
    get :index
    assert_response :success
  end
end
