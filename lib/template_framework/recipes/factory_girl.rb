say("\nReplacing Fixtures with FactoryGirl\n", Thor::Shell::Color::YELLOW)
gem 'factory_girl_rails', '~> 1.2', :group => [:development, :test]

templater.post_bundler do
  environment templater.load_snippet("generator_#{templater.testing_framework.type}", 'factory_girl')
end