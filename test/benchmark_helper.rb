ENV["RAILS_ENV"] = "benchmark"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rails/performance_test_help'

class ActionDispatch::PerformanceTest
  self.profile_options = { runs: 1, metrics: [:wall_time],
                           output: 'tmp/performance', formats: [:flat] }

  require 'database_cleaner'
  DatabaseCleaner[:neo4j, connection: {type: Rails.configuration.neo4j.session_type, path: Rails.configuration.neo4j.session_path}]
  DatabaseCleaner.strategy = :truncation
end