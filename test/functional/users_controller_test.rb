require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "get users works" do
  	get :new
    assert_response :success
  end
end
