append_file 'Gemfile', <<-EOF
group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', '>= 2.0.0.beta.17'
  gem 'spork'
  gem 'launchy'
end
EOF

add_template_generator 'cucumber:install --rspec --capybara --skip-database'