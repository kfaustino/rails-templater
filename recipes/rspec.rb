append_file 'Gemfile', <<-EOF
group :development, :test do
  gem 'rspec-rails', '>= 2.0.0.beta.17'
end
EOF

stategies << lambda do
  generate 'rspec:install'
  
  spec_helper_path = 'spec/spec_helper.rb'
  
  inject_into_file spec_helper_path, "\nrequire 'factory_girl'", :after => "require 'rspec/rails'"
  
  gsub_file spec_helper_path, 'config.fixture_path = "#{::Rails.root}/spec/fixtures"', ''
  gsub_file spec_helper_path, /(config.use_transactional_fixtures = true)/, '# \1'
  
  mongoid_rspec_truncation = <<-MONGOID
  
    config.before :each do
      Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
    end
    
  MONGOID
    
  inject_into_file spec_helper_path, mongoid_rspec_truncation, :after => "# config.use_transactional_fixtures = true\n"

end
