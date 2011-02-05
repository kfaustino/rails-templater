if templater.testing_framework.rspec?
  gem 'cover_me', '>= 1.0.0.rc5', :group => :test

  templater.post_bundler do
    generate "cover_me:install"
    inject_into_file 'spec/spec_helper.rb', "\nrequire 'cover_me'", :after => "ENV[\"RAILS_ENV\"] ||= 'test'"
  end
end
