gem 'capybara', :group => :test
gem 'cucumber-rails', :group => :test
gem 'launchy', :group => :test

stategies <<  lambda do
  generate 'cucumber:install --rspec --capybara --skip-database'

  cukes_factory_girl = <<-END

  require 'factory_girl'
  require 'factory_girl/step_definitions'
  Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','..','spec','factories','*.rb'))].each {|f| require f}

  END

  inject_into_file "features/support/env.rb",
    "\nCapybara.save_and_open_page_path = 'tmp/capybara/'",
    :after => 'Capybara.default_selector = :css'

  inject_into_file "features/support/env.rb", cukes_factory_girl, :after => 'ActionController::Base.allow_rescue = false'

  # Mongoid truncation strategy
  create_file 'features/support/hooks.rb', load_template('features/support/hooks.rb', 'mongoid')

  # Compliment to factory_girl step definitions
  create_file 'features/step_definitions/mongoid_steps.rb', load_template('features/step_definitions/mongoid_steps.rb', 'mongoid')
end
