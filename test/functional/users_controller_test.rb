require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "get edit" do
  	get :edit, {:id=>1}
    assert_response :success
  end

end
