require 'test_helper'

class HelpersFirstTest < ActionView::TestCase
  include RailsPagination::ActionView::Base

  setup do
    10.times.each { |id| Model.create title: "Record #{id}" }
    @pager = paginate(Model.page(1).per(2), navigation: 3, parameter: :page)
  end

  test "should have multiple pages" do
    assert @pager.has_multiple_pages?
  end

  test "should not have first page" do
    assert !@pager.has_first_page?
  end
  
  test "should not have previous page" do
    assert !@pager.has_previous_page?
  end

  test "should have next page" do
    assert @pager.has_next_page?
  end

  test "should have last page" do
    assert @pager.has_last_page?
  end

  test "should not have less pages" do
    assert !@pager.navigation.has_less_pages?
  end

  test "should have start at 1 and end at 3" do
    assert_equal @pager.navigation.pages, 1..3
  end

  test "shuld have more pages" do
    assert @pager.navigation.has_more_pages?
  end

end
