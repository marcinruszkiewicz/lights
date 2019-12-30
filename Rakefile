# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :test do
  puts `bundle exec rspec spec/`
  puts `bundle exec cucumber spec/features/`
end

task default: :spec
