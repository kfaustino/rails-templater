require 'spec_helper'

describe RailsTemplater::FixtureReplacement do
  
  context "Fixture Replacement type has not been set" do
    its(:type) { should == :factory_girl }
  end

  context "Fxiture Replacement type has been set to FactoryGirl" do
    
    before(:each) do
      subject.type = :factory_girl
    end
    
    it { should be_factory_girl }
    
  end
  
  describe "#type" do
    
    it "allows setting of only supported Fixture Replacements" do
      expect {
        subject.type = :fixture
      }.to raise_error(RailsTemplater::NotSupportedError)
    end
    
  end
  
end