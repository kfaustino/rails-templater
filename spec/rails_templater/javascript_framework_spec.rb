require 'spec_helper'

describe RailsTemplater::JavaScriptFramework do
  
  context "JavaScript Framework type has not been set" do
    its(:type) { should == :jquery }
  end

  context "JavaScript Framework type has been set to jQuery" do
  
    before(:each) do
      subject.type = :jquery
    end
    
    it { should be_jquery }
  
  end
  
  context "JavaScript Framework type has been set to Prototype" do
  
    before(:each) do
      subject.type = :prototype
    end
    
    it { should be_prototype }
  
  end
  
end