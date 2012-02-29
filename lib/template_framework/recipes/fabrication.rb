gem 'fabrication'

if templater.testing_framework.rspec?
  environment templater.load_snippet('generator_rspec', 'fabrication')
else
  environment templater.load_snippet('generator_test-unit', 'fabrication')
end
