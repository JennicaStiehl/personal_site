require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/minitest'
require './app/controllers/personal_site'

Capybara.app = PersonalSite

class CapybaraTestCase < Minitest::Test
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  Capybara.save_path = './tmp/capybara'

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
