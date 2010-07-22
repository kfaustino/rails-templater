gem 'mongoid', '>= 2.0.0.beta9'
gem 'bson_ext', '1.0.4'

stategies << lambda do
  generate 'mongoid:config'
end
