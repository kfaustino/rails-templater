gem 'jquery-rails'

gsub_file 'config/application.rb', /(config.action_view.javascript_expansions\[:defaults\] = %w\(\))/, '# \1'

templater.post_bundler do
  generate 'jquery:install'
end