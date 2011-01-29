if yes?("\n[Template Engine] Would you like use Haml for your view templates? [y|n]: ", Thor::Shell::Color::BLUE)
  gem 'haml'
  gem "haml-rails"

  remove_file 'app/views/layouts/application.html.erb'
  create_file 'app/views/layouts/application.html.haml', templater.load_template('app/views/layouts/application.html.haml','haml')
end
