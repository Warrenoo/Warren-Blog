require 'test_helper'

class BlogCellTest < Cell::TestCase
  test "recommend" do
    invoke :recommend
    assert_select "p"
  end
  

end
