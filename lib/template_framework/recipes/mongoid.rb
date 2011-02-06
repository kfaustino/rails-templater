say("\nReplacing ActiveRecord with Mongoid\n", Thor::Shell::Color::YELLOW )

gem 'mongoid', '2.0.0.rc.7'
gem 'bson_ext', '~> 1.2'

gsub_file 'config/application.rb', 'require "active_record/railtie"', '# require "active_record/railtie"'

templater.post_bundler do
  generate 'mongoid:config'
  run 'cp config/mongoid.yml config/mongoid.yml.example'
end
