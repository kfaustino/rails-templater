require File.join(File.dirname(__FILE__), 'core_extensions.rb')

apply generator_path('default')
apply generator_path('jquery')
apply generator_path('mongoid')
apply generator_path('haml')


generators_configuration = <<-END
config.generators do |g|
  g.template_engine :haml
end
END

environment generators_configuration