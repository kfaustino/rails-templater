gem 'remarkable_activemodel', '>=4.0.0.alpha4', :group => :test

stategies << lambda do
  inject_into_file 'spec/spec_helper.rb', "\nrequire 'remarkable/active_model'", :after => "require 'rspec/rails'"
end
