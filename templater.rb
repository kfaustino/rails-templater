require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

required_recipes = %w(default jquery formtastic haml rspec factory_girl remarkable mongrel)
required_recipes.each {|required_recipe| apply recipe(required_recipe)}

load_options
apply(recipe('cucumber')) if yes?("Do you want to some cukes?")  
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