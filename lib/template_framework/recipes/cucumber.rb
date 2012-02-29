if yes?("\n[Integration Testing] Would you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::BLUE)

  gem 'cucumber-rails', '~> 1.3', :group => :test
  gem 'database_cleaner', :group => :test

  cucumber_generate_command = "cucumber:install"
  cucumber_generate_command << ' --skip-database' if templater.orm.mongoid?

  templater.post_bundler do
    generate cucumber_generate_command

    if templater.testing_framework.rspec? && templater.fixture_replacement.factory_girl?
      inject_into_file "features/support/env.rb", templater.load_snippet("factory_girl", 'cucumber'), :after => 'ActionController::Base.allow_rescue = false'
    end

    # Mongoid truncation strategy
    if templater.orm.mongoid?
      gsub_file 'features/support/env.rb', 'DatabaseCleaner.strategy = :transaction', 'DatabaseCleaner.strategy = :truncation'


      # Compliment to factory_girl step definitions
      if templater.fixture_replacement.factory_girl?
        create_file 'features/step_definitions/mongoid_steps.rb', templater.load_template('features/step_definitions/mongoid_steps.rb', 'mongoid')
      end
    end
  end
end
