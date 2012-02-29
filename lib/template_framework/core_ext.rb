module Rails
  module Generators
    module Actions
      def templater
        @templater ||= RailsTemplater::Templater.new
      end

      def execute_post_bundler_strategies
        templater.post_bundler_strategies.each {|strategy| strategy.call }
      end
    end
  end
end
