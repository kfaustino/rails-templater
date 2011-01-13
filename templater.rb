require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

required_recipes = %w(default mongoid jquery haml rspec factory_girl remarkable)
required_recipes.each {|required_recipe| apply recipe(required_recipe)}

load_options
apply(recipe('cucumber')) if yes?("Would you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::GREEN)  
apply recipe('design')

run 'bundle install'

execute_stategies

generators_configuration = <<-END
config.generators do |g|
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
end
END

environment generators_configuration

git :add => "."
git :commit => "-m 'Initial commit'"  