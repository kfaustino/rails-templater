gem 'devise'

model_name = ask('Name of Devise model? [user]: ', Thor::Shell::Color::BLUE)
model_name = 'user' if model_name.blank?

generate_views = yes?('Generate Devise views? [y|n]: ', Thor::Shell::Color::BLUE)

if generate_views && templater.template_engine.slim?
  # hpricot and haml2slim is required for converting to slim templates
  gem 'haml2slim', :group => :development
  gem 'hpricot'
end

templater.post_bundler do
  generate "devise:install"
  generate "devise #{model_name}"
  generate "devise:views -e erb" if generate_views
  if generate_views && (templater.template_engine.haml? || templater.template_engine.slim?)
    erb_files = Dir.glob File.join("app", "views", "devise", "*", "*.erb")
    erb_files.each do |erb_file|
      haml_file = erb_file.sub /erb$/, 'haml'
      system "bundle exec html2haml --erb #{erb_file} #{haml_file}"
      remove_file erb_file

      if templater.template_engine.slim?
        system "bundle exec haml2slim #{haml_file} #{erb_file.sub /erb$/, 'slim'}"
        remove_file haml_file
      end
    end
  end
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
