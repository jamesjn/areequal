require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "does not save if no id" do
    user = User.new
    assert !user.save
  end
  test "does save if only id" do
    user = User.find_or_create_by_id(123123)
    assert user.save
  end
end
