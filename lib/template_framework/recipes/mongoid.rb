gem 'mongoid', '2.0.0.beta.20'
gem 'bson_ext', '~> 1.1'

gsub_file 'config/application.rb', 'require "active_record/railtie"', '# require "active_record/railtie"'

templater.post_bundler_strategies << lambda do
  generate 'mongoid:config'
  run 'cp config/mongoid.yml config/mongoid.yml.example'
end
