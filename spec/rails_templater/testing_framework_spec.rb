require 'spec_helper'

describe RailsTemplater::TestingFramework do
  
  it "defaults to RSpec" do
    subject.type.should == :rspec
  end
  
  context "Testing Framework type is set to RSpec" do
    
    before(:each) do
      subject.type = :rspec
    end
    
    it { should be_rspec }
    
  end
  
  context "Testing Framework type is set to TestUnit" do
    
    before(:each) do
      subject.type = :test_unit
    end
    
    it { should be_test_unit }
    
  end
  
  it "only sets type to supported Test Frameworks" do
    expect{
      subject.type = :random
    }.to raise_error(RailsTemplater::NotSupportedError)
  end
  
end