gem 'factory_girl_rails', '1.1.beta1', :group => :test

templater.post_bundler_strategies << lambda do
  if templater.testing_framework.rspec?
    inject_into_file 'spec/spec_helper.rb', "\nrequire 'factory_girl'", :after => "require 'rspec/rails'"
  elsif templater.testing_framework.test_unit?
    inject_into_file 'test/test_helper.rb', "\nrequire 'factory_girl'", :after => "require 'rails/test_help'"
  end
end