# Initialize jQuery
get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js",  "public/javascripts/jquery.js"
create_file 'public/javascripts/rails.js', load_template('rails.js', 'jquery')

# Set default JavaScript files
jquery_configuration = <<-END
config.before_initialize do
  config.action_view.javascript_expansions[:defaults] = %w(jquery rails application)
end
END

environment jquery_configuration
