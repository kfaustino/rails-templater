gsub_file 'Gemfile', /(gem "rspec-rails".*:group =>) \[:development, :test\]/, '\1 [:development, :test, :cucumber]'
gsub_file 'Gemfile', /(gem "factory_girl_rails".*:group =>) :test/, '\1 [:test, :cucumber]'

append_file 'Gemfile', <<-EOF
group :cucumber do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'spork'
  gem 'launchy'
end
EOF

stategies <<  lambda do
  generate 'cucumber:install --rspec --capybara --skip-database'

  # Mongoid truncation strategy
  create_file 'features/support/hooks.rb', load_template('features/support/hooks.rb', 'mongoid')
  
end