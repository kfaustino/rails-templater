say "\nReplacing ERb with Haml as your Template Engine\n", Thor::Shell::Color::YELLOW

gem "haml-rails"

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.haml', templater.load_template('app/views/layouts/application.html.haml', 'haml')
