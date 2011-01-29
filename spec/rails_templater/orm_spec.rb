require 'spec_helper'

describe RailsTemplater::Orm do

  it "defaults to Mongoid" do
    subject.type.should == :mongoid
  end
  
  context "ORM type is ActiveRecord" do
    
    before(:each) do
      subject.type = :active_record
    end
    
    it { should be_active_record }
    
  end

  context "ORM type is Mongoid" do
    
    before(:each) do
      subject.type = :mongoid
    end
    
    it { should be_mongoid }
    
  end
  
  it "only sets type to supported ORMs" do
    expect{
      subject.type = :mongo_mapper
    }.to raise_error(RailsTemplater::NotSupportedError)
  end
  
  
end