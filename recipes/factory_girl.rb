gem 'factory_girl_rails', '1.1.beta1', :group => :test

stategies << lambda do
  inject_into_file 'spec/spec_helper.rb', "\nrequire 'factory_girl'", :after => "require 'rspec/rails'"
end