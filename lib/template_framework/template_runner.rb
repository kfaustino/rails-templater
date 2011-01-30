#require File.join(File.dirname(__FILE__), 'core_extensions.rb')
$LOAD_PATH.unshift(File.expand_path('./../../', __FILE__))

require 'rails_templater'
require File.join(File.dirname(__FILE__), 'core_ext.rb')

required_recipes = %w(default orm testing_framework javascript_framework haml sass cucumber)
required_recipes.each {|required_recipe| apply templater.recipe(required_recipe)}

say("\nInitial generation complete\n", Thor::Shell::Color::YELLOW)

say("\nBeginning bundle install\n", Thor::Shell::Color::YELLOW)
run 'bundle install'
say("\nbundle install complete\n", Thor::Shell::Color::YELLOW)

execute_post_bundler_strategies

git :add => "."
git :commit => "-m 'Initial commit'"  