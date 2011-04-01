gem 'devise'

model_name = ask('Name of Devise model? [user]: ', Thor::Shell::Color::BLUE)
model_name = 'user' if model_name.blank?

generate_views = yes?('Generate Devise views? [y|n]: ', Thor::Shell::Color::BLUE)

templater.post_bundler do
  generate "devise:install"
  generate "devise #{model_name}"
  generate "devise:views -e #{templater.template_engine.type}" if generate_views
end

# Modify ActionMailer configuration for Devise
gsub_file 'config/environments/development.rb',
  /# Don't care if the mailer can't send/,
  '# ActionMailer Config'
inject_into_file 'config/environments/development.rb',
  templater.load_snippet('actionmailer_development', 'devise'),
  :after => '# ActionMailer Config'
inject_into_file 'config/environments/production.rb',
  templater.load_snippet('actionmailer_production', 'devise'),
  :after => 'config.i18n.fallbacks = true'
