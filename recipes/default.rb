# Delete all unnecessary files
remove_file "README"
remove_file "public/index.html"
remove_file "public/robots.txt"
remove_file "public/images/rails.png"

create_file 'README'
create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'

# .rvmrc
create_file '.rvmrc', 'rvm 1.8.7'
run 'rvm rvmrc trust'

gsub_file 'config/application.rb', 'require "rails/test_unit/railtie"', '# require "rails/test_unit/railtie"'

get "http://html5shiv.googlecode.com/svn/trunk/html5.js", "public/javascripts/html5.js"

git :init

append_file '.gitignore', load_template('gitignore','git')

gem 'rails3-generators'