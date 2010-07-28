gem 'mongoid', '>= 2.0.0.beta.14'
gem 'bson_ext', '1.0.4'

stategies << lambda do
  generate 'mongoid:config'
  run 'cp config/mongoid.yml config/mongoid.yml.example'
end
