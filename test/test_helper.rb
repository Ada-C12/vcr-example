require "minitest/autorun"
require "minitest/reporters"
require "vcr"
require "webmock/minitest"
require "dotenv"

Dotenv.load

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/seven_wonders"
