require 'test_helper'

class BlogCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
