require 'spec_helper'

describe RailsTemplater::Templater do

  let(:group) { 'sample' }

  its(:fixture_replacement) { should be_kind_of(RailsTemplater::FixtureReplacement) }
  its(:orm) { should be_kind_of(RailsTemplater::Orm) }
  its(:testing_framework) { should be_kind_of(RailsTemplater::TestingFramework) }

  it "generates a recipe path based on a name" do
    subject.recipe("mongoid").should == File.expand_path('recipes/mongoid.rb', TEMPLATE_FRAMEWORK_PATH)
  end

  it "generates a snippet path" do
    subject.snippet_path("cucumber").should == File.expand_path('snippets/cucumber', TEMPLATE_FRAMEWORK_PATH)
  end

  it "generates a template path" do
    subject.template_path("haml").should == File.expand_path('templates/haml', TEMPLATE_FRAMEWORK_PATH)
  end

  describe "#load_snippet" do

    let(:snippet_name) { 'sample_snippet' }

    before(:each) do
      subject.stub(:snippet_path) { FIXTURE_PATH }
    end

    it "loads a snippet" do
      subject.load_snippet(snippet_name, group).should == load_fixture(snippet_name)
    end

  end

  describe "#load_template" do

    let(:template_name) { 'sample_template.rb' }

    before(:each) do
      subject.stub(:template_path) { FIXTURE_PATH }
    end

    it "loads a template" do
      subject.load_template(template_name, group).should == load_fixture(template_name)
    end

  end

  describe "#post_bundler" do

    it "adds blocks to post_bundler_strategies" do
      subject.post_bundler do
        "Hi"
      end
      subject.post_bundler_strategies.should have(1).item
      result = subject.post_bundler_strategies.first.call
      result.should == 'Hi'
    end

  end

end
