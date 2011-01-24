gem 'haml'
gem "haml-rails"

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.haml', templater.load_template('app/views/layouts/application.html.haml','haml')