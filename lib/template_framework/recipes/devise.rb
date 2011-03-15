gem 'devise'

templater.post_bundler do
  generate "devise:install"
  generate "devise user"
end
