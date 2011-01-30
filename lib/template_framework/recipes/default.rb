# Delete all unnecessary files
remove_file "README"
remove_file "public/index.html"
remove_file "public/robots.txt"
remove_file "public/images/rails.png"

# Create project files
create_file 'README'
create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'

get "http://html5shiv.googlecode.com/svn/trunk/html5.js", "public/javascripts/html5.js"

apply templater.recipe('git')