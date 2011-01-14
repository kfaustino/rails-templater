gem 'remarkable_activemodel', '>=4.0.0.alpha4', :group => :test
gem 'remarkable_mongoid', :group => :test

post_bundler_strategies << lambda do
  inject_into_file 'spec/spec_helper.rb', "\nrequire 'remarkable/active_model'\nrequire 'remarkable/mongoid'", :after => "require 'rspec/rails'"
end
