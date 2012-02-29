module RailsTemplater
  class Templater

    attr_reader :post_bundler_strategies

    def initialize
      @post_bundler_strategies = []
      @template_framework_path = File.join(File.dirname(__FILE__), '..', 'template_framework')
    end

    def fixture_replacement
      @fixture_replacement ||= FixtureReplacement.new
    end

    def orm
      @orm ||= Orm.new
    end

    def javascript_framework
      @javascript_framework ||= JavaScriptFramework.new
    end

    def template_engine
      @template_engine ||= TemplateEngine.new
    end

    def post_bundler(&block)
      @post_bundler_strategies << block
    end

    def recipe(name)
      File.expand_path("recipes/#{name}.rb", @template_framework_path)
    end

    ['snippet', 'template'].each do |type|

      define_method "#{type}_path" do |group|
        File.expand_path("#{type}s/#{group}", @template_framework_path)
      end

      define_method "load_#{type}" do |name, group|
        group_path = send("#{type}_path".to_sym, group)
        File.read  File.expand_path(name, group_path)
      end

    end

    def testing_framework
      @testing_framework ||= TestingFramework.new
    end
  end
end
