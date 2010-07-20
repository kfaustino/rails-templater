require File.join(File.dirname(__FILE__), 'core_extensions.rb')

initialize_templater

apply recipe('default')
apply recipe('jquery')
apply recipe('mongoid')
apply recipe('haml')
apply recipe('rspec')

run 'bundle install'

template_generators.each do |generator|
  generate generator
end

generators_configuration = <<-END
config.generators do |g|
  g.template_engine :haml
end
END

environment generators_configuration