if templater.testing_framework.rspec?
  say("\nReplacing Fixtures with FactoryGirl\n", Thor::Shell::Color::YELLOW)
  gem 'factory_girl_rails', '1.1.beta1', :group => :test

  templater.post_bundler_strategies << lambda do
    inject_into_file 'spec/spec_helper.rb', "\nrequire 'factory_girl'", :after => "require 'rspec/rails'"
    
    environment templater.load_snippet('generator', 'factory_girl')
    directory File.expand_path('./../../generators', __FILE__), 'lib/generators'    
  end
end
