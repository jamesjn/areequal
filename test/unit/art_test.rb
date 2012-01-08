require 'test_helper'

class ArtTest < ActiveSupport::TestCase
  test "should not save art without required fields" do
    art = Art.new
    assert !art.save
  end

  test "should save art when required fields are entered" do
    art = Art.new ({:user_id => 2, :title => "Title", :description => "description of art", :art1_type => "text", :art1_info => "art1 is the best!!!", :art2_type => "text", :art2_info => "another piece of art", :category => "text"})
    assert art.save
  end
end
