#require File.join(File.dirname(__FILE__), 'core_extensions.rb')
$LOAD_PATH.unshift(File.expand_path('./../../', __FILE__))

require 'rails_templater'
require File.join(File.dirname(__FILE__), 'core_ext.rb')

required_recipes = %w(orm rspec default jquery haml factory_girl remarkable)
required_recipes.each {|required_recipe| apply templater.recipe(required_recipe)}

say("\nInitial generation complete\n", Thor::Shell::Color::YELLOW)

apply(templater.recipe('cucumber')) if yes?("\nWould you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::BLUE)  
apply templater.recipe('design')

run 'bundle install'

execute_post_bundler_strategies

environment templater.load_snippet('generators', 'rails')

directory File.join(File.dirname(__FILE__),'generators'), 'lib/generators'

git :add => "."
git :commit => "-m 'Initial commit'"  