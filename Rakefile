require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test" # here is the test_helper
  t.pattern = "test/**/*_test.rb"
end

task default: :test

