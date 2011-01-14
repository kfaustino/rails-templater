module Rails
  module Generators
    module Actions

      attr_accessor :post_bundler_strategies
      attr_reader :template_options

      def initialize_templater
        @post_bundler_strategies = []
        @template_options = {}
      end

      def execute_post_bundler_strategies
        post_bundler_strategies.each {|strategy| strategy.call }
      end

      def load_options
        say "Would you like to use a design framework?\n", Thor::Shell::Color::BLUE
        print_table [ ['Option','Framework'], ['1', 'Compass with blueprint semantic'] ], :ident => 2
        design_input = ask("Option: ", Thor::Shell::Color::BLUE)
        @template_options[:design] = case design_input
          when "1"
            :compass
          else
            :none
        end
      end

      def recipe(name)
        File.join File.dirname(__FILE__), 'recipes', "#{name}.rb"
      end

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
