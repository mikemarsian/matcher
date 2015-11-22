require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:benchmark) do |t|
    t.libs << 'test'
    t.pattern = 'test/performance/**/*_test.rb'
    t.verbose = true
  end
end