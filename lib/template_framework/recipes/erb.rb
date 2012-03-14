remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.erb', templater.load_template('app/views/layouts/application.html.erb', 'erb')
