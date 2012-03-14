say("\nReplacing Fixtures with Fabrication\n", Thor::Shell::Color::YELLOW)

gem 'fabrication'

templater.post_bundler do
  environment templater.load_snippet("generator_#{templater.testing_framework.type}", 'fabrication')
end