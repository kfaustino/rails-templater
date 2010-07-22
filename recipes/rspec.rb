append_file 'Gemfile', <<-EOF
group :development, :test do
  gem 'rspec-rails', '>= 2.0.0.beta.17'
end
EOF

stategies << lambda { generate 'rspec:install' }
