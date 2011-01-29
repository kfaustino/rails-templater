require 'active_support/core_ext/string'

module RailsTemplater
  extend self
  
  autoload :Cli, 'rails_templater/cli'
  autoload :Orm, 'rails_templater/orm'
  autoload :Templater, 'rails_templater/templater'
  
  def template_runner
    File.join(File.dirname(__FILE__), 'template_framework', 'template_runner.rb')
  end
  
end