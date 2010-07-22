gem 'haml'

remove_file 'app/views/layouts/application.html.erb'
create_file 'app/views/layouts/application.html.haml', load_template('app/views/layouts/application.html.haml','haml')

initializer 'haml.rb',<<EOF
Haml::Template.options[:format] = :html5
EOF