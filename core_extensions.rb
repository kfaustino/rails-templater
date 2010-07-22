module Rails
  module Generators
    module Actions

      attr_accessor :stategies
      attr_reader :template_options

      def initialize_templater
        @stategies = []
        @template_options = {}
      end
      
      def execute_stategies
        stategies.each {|stategy| stategy.call }
      end

      def load_options
        @template_options[:design] = ask("Which design framework? [none(default), compass]: ").downcase
        @template_options[:design] = "none" if @template_options[:design].nil?
      end

      def recipe(name)
        File.join File.dirname(__FILE__), 'recipes', "#{name}.rb"
      end

      # TODO: Refactor loading of files
      
      def load_snippet(name, group)
        path = File.expand_path name, snippet_path(group)
        File.read path
      end

      def load_template(name, group)
        path = File.expand_path name, template_path(group)
        File.read path
      end      

      def snippet_path(name)
        File.join(File.dirname(__FILE__), 'snippets', name)
      end

      def template_path(name)
        File.join(File.dirname(__FILE__), 'templates', name)
      end

    end
  end
end
