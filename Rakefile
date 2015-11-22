# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# Rails 4 no longer defines db:test:prepare, however, rails-perftest still use test:prepare. So, we need to workaround.
Rake.application.instance_eval do
  # Remove test:prepare
  @tasks['test:benchmark'].prerequisites.shift if @tasks['test:benchmark']
  @tasks['test:profile'].prerequisites.shift if @tasks['test:profile']
end