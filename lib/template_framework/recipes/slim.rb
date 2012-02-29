say "\nReplacing ERb with Slim as your Template Engine\n", Thor::Shell::Color::YELLOW

gem 'slim-rails'

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.slim', templater.load_template('app/views/layouts/application.html.slim', 'slim')
