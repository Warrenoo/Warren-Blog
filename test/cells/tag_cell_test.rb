require 'test_helper'

class TagCellTest < Cell::TestCase
  test "list" do
    invoke :list
    assert_select "p"
  end
  

end
