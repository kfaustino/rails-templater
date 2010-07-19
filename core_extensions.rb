module Rails
  module Generators
    module Actions
      
      def generator_path(name)
        File.join File.dirname(__FILE__), 'generators', "#{name}.rb"
      end
      
      def load_template(file, parent)
        path = File.expand_path file, template_path(parent)
        File.read path
      end      
      
      def template_path(name)
         File.join(File.dirname(__FILE__), 'templates', name)
      end
      
    end
  end
end