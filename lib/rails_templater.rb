require 'active_support'

module RailsTemplater
  extend self
  
  autoload :Cli, 'rails_templater/cli'
  autoload :Templater, 'rails_templater/templater'
  
  def template_runner
    File.join(File.dirname(__FILE__), 'template_framework', 'template_runner.rb')
  end
  
end