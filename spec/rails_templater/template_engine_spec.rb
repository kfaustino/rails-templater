require 'spec_helper'

describe RailsTemplater::TemplateEngine do
  
  context "Template Engine type has not been set" do
    its(:type) { should == :haml }
  end

  context "Template Engine type has been set to Haml" do
  
    before(:each) do
      subject.type = :haml
    end
    
    it { should be_haml }
  
  end
  
  context "Template Engine type has been set to Slim" do
  
    before(:each) do
      subject.type = :slim
    end
    
    it { should be_slim }
  
  end
  
  context "Template Engine type has been set to ERb" do
  
    before(:each) do
      subject.type = :erb
    end
    
    it { should be_erb }
  
  end
  
  it "only sets type to supported Template Engines" do
    expect{
      subject.type = :random
    }.to raise_error(RailsTemplater::NotSupportedError)
  end
  
  
end