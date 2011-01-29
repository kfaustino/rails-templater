if yes?("\nWould you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::BLUE)

  gem 'capybara', '0.4.0', :group => :test
  gem 'cucumber-rails', :group => :test
  gem 'launchy', :group => :test

  cucumber_generate_command = "cucumber:install --capybara"
  cucumber_generate_command << ' --skip-database' if templater.orm.mongoid?
  cucumber_generate_command << ' --rspec' if templater.testing_framework.rspec?
  cucumber_generate_command << ' --testunit' if templater.testing_framework.test_unit?

  templater.post_bundler do
    generate cucumber_generate_command

    gsub_file 'features/support/env.rb',
      "require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript", ''

    inject_into_file "features/support/env.rb",
      "\nCapybara.save_and_open_page_path = 'tmp/capybara/'",
      :after => 'Capybara.default_selector = :css'

    if templater.testing_framework.rspec? && templater.fixture_replacement.factory_girl?
      inject_into_file "features/support/env.rb", templater.load_snippet("factory_girl", 'cucumber'), :after => 'ActionController::Base.allow_rescue = false'
    end

    # Mongoid truncation strategy
    if templater.orm.mongoid?
      create_file 'features/support/hooks.rb', templater.load_template('features/support/hooks.rb', 'mongoid')

      # Compliment to factory_girl step definitions
      create_file 'features/step_definitions/mongoid_steps.rb', templater.load_template('features/step_definitions/mongoid_steps.rb', 'mongoid')
    end

  end
end
