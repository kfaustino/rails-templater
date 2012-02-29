say("\nReplacing ActiveRecord with Mongoid\n", Thor::Shell::Color::YELLOW )

gem 'mongoid', '~> 2.4'
gem 'bson_ext', '~> 1.6'

gsub_file 'config/application.rb', 'require "active_record/railtie"', '# require "active_record/railtie"'

templater.post_bundler do
  generate 'mongoid:config'
  run 'cp config/mongoid.yml config/mongoid.yml.example'
  create_file 'lib/tasks/assets.rake', templater.load_template('lib/tasks/assets.rake', 'mongoid')
end
