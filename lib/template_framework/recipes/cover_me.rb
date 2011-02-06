gem 'cover_me', '>= 1.0.0.rc5', :group => :test

templater.post_bundler do
  generate "cover_me:install"

  testing_framework_helper = templater.testing_framework.rspec? ? 'spec/spec_helper.rb' : 'test/test_helper.rb'
  inject_into_file testing_framework_helper, "\nrequire 'cover_me'", :after => "ENV[\"RAILS_ENV\"] ||= 'test'"
end
