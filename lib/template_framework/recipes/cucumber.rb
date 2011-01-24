gem 'capybara', '0.4.0', :group => :test
gem 'cucumber-rails', :group => :test
gem 'launchy', :group => :test

templater.post_bundler_strategies <<  lambda do
  generate 'cucumber:install --rspec --capybara --skip-database'
  
  gsub_file 'features/support/env.rb', 
  "require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript", ''

  inject_into_file "features/support/env.rb",
    "\nCapybara.save_and_open_page_path = 'tmp/capybara/'",
    :after => 'Capybara.default_selector = :css'

  inject_into_file "features/support/env.rb", templater.load_snippet('factory_girl', 'cucumber'), :after => 'ActionController::Base.allow_rescue = false'

  # Mongoid truncation strategy
  create_file 'features/support/hooks.rb', templater.load_template('features/support/hooks.rb', 'mongoid')

  # Compliment to factory_girl step definitions
  create_file 'features/step_definitions/mongoid_steps.rb', templater.load_template('features/step_definitions/mongoid_steps.rb', 'mongoid')
end
