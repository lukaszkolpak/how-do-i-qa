ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :selenium

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.use_transactional_fixtures = true

end
