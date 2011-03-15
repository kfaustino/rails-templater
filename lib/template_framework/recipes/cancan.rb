gem 'cancan'

inject_into_file 'app/controllers/application_controller.rb',
  templater.load_snippet('authorize', 'cancan'),
  :before => /^end$/

templater.post_bundler do
  generate 'cancan:ability'
end
