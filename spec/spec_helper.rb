require 'simplecov' 
SimpleCov.start 'rails' do
  add_filter '/app/controllers/'
  add_filter '/app/workers/' 
end


ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'support/vcr.rb'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.extend VCR::RSpec::Macros
  config.include Sorcery::TestHelpers::Rails

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end

module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(email, password)
        page.driver.post('/signin', { email: email, password: password}) 
      end

       def login_user(email, password, redirect_path = "/")
        visit login_path
        fill_in "email", :with => email
        fill_in "password", :with => password
        click_button "Login"
      end
    end
  end
end
