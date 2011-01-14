module RailsTemplater
  extend self
  
  autoload :Cli, 'rails_templater/cli'
  
  def template_path
    File.join(File.dirname(__FILE__), 'template', 'templater.rb')
  end
  
end
