# Initialize jQuery
get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js",  "public/javascripts/jquery.js"
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

#initializer "jquery.rb",  File.expand_path('config/initializers/jquery.rb', jquery_template_path)
#copy_file , 'config/initializers/jquery.rb'
initializer 'jquery.rb', load_template('config/initializers/jquery.rb','jquery')