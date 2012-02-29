$LOAD_PATH.unshift(File.expand_path('./../../', __FILE__))

require 'rails_templater'
require File.join(File.dirname(__FILE__), 'core_ext.rb')

%w(default orm testing_framework fixture_replacement code_coverage javascript_framework template_engine compass cucumber pry).each do |recipe|
  apply templater.recipe(recipe)
end

say("\nInitial generation complete\n", Thor::Shell::Color::YELLOW)

say("\nBeginning bundle install\n", Thor::Shell::Color::YELLOW)
run 'bundle install'
say("\nbundle install complete\n", Thor::Shell::Color::YELLOW)

execute_post_bundler_strategies

git :add => "."
git :commit => "-m 'Initial commit'"