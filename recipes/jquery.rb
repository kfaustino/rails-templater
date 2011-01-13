gem 'jquery-rails'

gsub_file 'config/application.rb', /(config.action_view.javascript_expansions\[:defaults\] = %w\(\))/, '# \1'

post_bundler_strategies << lambda do
  generate 'jquery:install'
end