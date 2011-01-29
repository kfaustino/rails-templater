say("\nReplacing Prototype with JQuery as your JavaScript Framework\n", Thor::Shell::Color::YELLOW )

gem 'jquery-rails'

remove_file 'public/javascripts/rails.js'
gsub_file 'config/application.rb', /(config.action_view.javascript_expansions\[:defaults\] = %w\(\))/, '# \1'

templater.post_bundler do
  generate 'jquery:install'
end