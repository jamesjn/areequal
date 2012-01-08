require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test "urls will be decoded properly" do
    sig = urldecode64("urldecode64fgu1sl07MxDizQau1l81zBXBflTqBvLXDaO51dqN9Lw.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNvZGUiOiIyLkFRQ3RCT05qQkxkQUdObWMuMzYwMC4xMzI2MDYzNjAwLjEtODg0MzgzNnxmSFhGaFZUWTFFZWdkS0hpaGtwSklzV3AteFEiLCJpc3N1ZWRfYXQiOjEzMjYwNTkyNTcsInVzZXJfaWQiOiI4ODQzODM2In0")
    p sig
    assert sig
  end
end
