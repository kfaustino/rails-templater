append_file 'Gemfile', <<-EOF
group :cucumber do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'rspec-rails', '>= 2.0.0.beta.17'
  gem 'spork'
  gem 'launchy'
end
EOF

stategies <<  lambda do
  generate 'cucumber:install --rspec --capybara --skip-database'
end