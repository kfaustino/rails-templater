require 'spec_helper'

describe RailsTemplater do
  
  subject { RailsTemplater }
  
  its(:template_runner) { should == File.expand_path('template_runner.rb', TEMPLATE_FRAMEWORK_PATH)}
  
end