gem 'rspec-rails', '>= 2.4.1', :group => [:development]

gsub_file 'config/application.rb', 'require "rails/test_unit/railtie"', '# require "rails/test_unit/railtie"'

templater.post_bundler_strategies << lambda do
  generate 'rspec:install'

  spec_helper_path = 'spec/spec_helper.rb'

  gsub_file spec_helper_path, 'config.fixture_path = "#{::Rails.root}/spec/fixtures"', ''

  if templater.orm.mongoid?
    gsub_file spec_helper_path, /(config.use_transactional_fixtures = true)/, '# \1'
    inject_into_file spec_helper_path, templater.load_snippet('mongoid', 'rspec'), :after => "# config.use_transactional_fixtures = true\n"
  end
end
