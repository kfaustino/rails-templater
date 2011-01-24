begin
  require 'bundler'
  Bundler.setup(:default, :development)
rescue LoadError => e
  # Fall back on doing an unlocked resolve at runtime.
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end

require 'rails_templater'
require 'rspec'

# # Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__),'/support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec  
end