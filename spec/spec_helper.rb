require "bundler/setup"
require "lights"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  # config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def file_fixture(fixture_name)
  path = Pathname.new(File.join(fixture_name))

  if path.exist?
    path
  else
    msg = "file does not exist: '%s'"
    raise ArgumentError, format(msg, fixture_name)
  end
end