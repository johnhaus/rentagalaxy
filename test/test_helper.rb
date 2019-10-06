ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Warden::Test::Helpers
  Warden.test_mode!
  # Add more helper methods to be used by all tests here...
end

Capybara.register_driver :firefox_headless do |app|
  options = Selenium::WebDriver::Firefox::Options.new(args: %w[no-sandbox headless disable-gpu window-size=1400,900])
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :firefox_headless
