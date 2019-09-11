require "minitest/autorun"
require "minitest/reporters"
require "vcr"
require "webmock/minitest"
require "dotenv"

Dotenv.load

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/seven_wonders"

VCR.configure do |config|
  config.cassette_library_dir = "test/cassettes" # where to save cassettes
  config.hook_into :webmock  # use webmock
  config.default_cassette_options = {
    record: :new_episodes, # record new data when we don't have it
    match_requests_on: [:method, :uri, :body] # match all of these
  }

  config.filter_sensitive_data("<API_TOKEN>") do
    ENV["API_TOKEN"]
  end
end