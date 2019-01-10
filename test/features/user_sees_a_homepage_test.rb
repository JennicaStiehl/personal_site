require './test/test_helper'

class HomepageTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'
    # save_and_open_page
    assert page.has_content?("Welcome!")
    assert_equal 200, page.status_code
  end

  def test_user_can_see_the_error_message
    visit '/error'

    assert page.has_content?("Page not found.")
    assert_equal 404, page.status_code
  end


end
# When we assert that the page.has_content?("Welcome!"), we are checking that Welcome! is in the body of our response. When we assert that the status code is 200, we're checking to see that's what our server sent back.
#
# If you want a full list of methods that you can call on page, you can run page.methods.
