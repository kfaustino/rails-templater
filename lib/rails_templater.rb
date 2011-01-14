module RailsTemplater
  extend self
  
  def template_path
    File.join(File.dirname(__FILE__), 'template', 'templater.rb')
  end
  
end
