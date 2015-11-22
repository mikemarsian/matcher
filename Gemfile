source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'neo4j', '~> 5.0.0'
gem 'haml-rails', '~> 0.9'

# Use ActiveModel has_secure_password
#gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :benchmark do
  gem 'rails-perftest'
  gem 'ruby-prof', '0.12.2'
  gem 'rack-cache'
end

group :benchmark, :test, :development do
  gem 'faker', github: 'stympy/faker'
  gem 'pry-rails'
  gem 'database_cleaner', '~> 1.5.1'
end

