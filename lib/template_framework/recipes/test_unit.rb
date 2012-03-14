gsub_file 'config/application.rb', '# require "rails/test_unit/railtie"', 'require "rails/test_unit/railtie"'

if yes?("\nWould you like to use Shoulda contexts? [y|n]: ", Thor::Shell::Color::BLUE)
  gem 'shoulda-context', :group => :test
end

apply templater.recipe('shoulda_matchers')

