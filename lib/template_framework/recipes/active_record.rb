gem 'sqlite3-ruby', :require => 'sqlite3'

gsub_file 'config/application.rb', '# require "active_record/railtie"', 'require "active_record/railtie"'
create_file 'config/database.yml', templater.load_template('config/database.yml', 'active_record')
run 'cp config/database.yml config/database.yml.example'