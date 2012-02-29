require 'active_support/core_ext/string'

module RailsTemplater
  extend self

  class NotSupportedError < Exception; end

  autoload :Cli, 'rails_templater/cli'
  autoload :FixtureReplacement, 'rails_templater/fixture_replacement'
  autoload :JavaScriptFramework, 'rails_templater/javascript_framework'
  autoload :Orm, 'rails_templater/orm'
  autoload :Templater, 'rails_templater/templater'
  autoload :TemplateEngine, 'rails_templater/template_engine'
  autoload :TestingFramework, 'rails_templater/testing_framework'

  def template_runner
    File.join(File.dirname(__FILE__), 'template_framework', 'template_runner.rb')
  end
end
