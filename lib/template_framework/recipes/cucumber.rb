if yes?("\n[Integration Testing] Would you like to add integration testing with Cucumber? [y|n]: ", Thor::Shell::Color::BLUE)

  gem 'cucumber-rails', '~> 1.3', :group => :test
  gem 'database_cleaner', :group => :test

  cucumber_generate_command = "cucumber:install"
  cucumber_generate_command << ' --skip-database' if templater.orm.mongoid?

  templater.post_bundler do
    generate cucumber_generate_command

    if templater.fixture_replacement.factory_girl?
      inject_into_file "features/support/env.rb", templater.load_snippet("factory_girl", 'cucumber'), :after => 'ActionController::Base.allow_rescue = false'
    elsif templater.fixture_replacement.fabrication?
      generate 'fabrication:cucumber_steps'
    end

    # Mongoid truncation strategy
    if templater.orm.mongoid?
      gsub_file 'features/support/env.rb', 'DatabaseCleaner.strategy = :transaction', 'DatabaseCleaner.strategy = :truncation'
    end
  end
end
