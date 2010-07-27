# Initialize jQuery
get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js",  "public/javascripts/jquery.js"
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

# Set default JavaScript files
environment "config.action_view.javascript_expansions = { :defaults => ['jquery', 'rails'] }"