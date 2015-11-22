require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "neo4j/railtie"
# need active_record for CircleCI to work
require "active_record/railtie"
#require "sprockets/railtie"
# require "active_job/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Matcher
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true

    config.autoload_paths += Dir["#{config.root}/app/services/**/"].select { |f| File.directory?(f) }

    config.generators do |g|
      g.orm :neo4j
      g.factory_girl false
    end

  # Neo4j setup
    config.neo4j.session_type = :server_db
    config.neo4j.session_path = 'http://localhost:7474'
    config.neo4j.session_options = {basic_auth: { username: 'neo4j', password: 'root'}}
    config.neo4j.storage_path = "#{config.root}/db/neo4j-#{Rails.env}"
  end
end
