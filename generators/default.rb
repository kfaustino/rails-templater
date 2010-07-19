# Delete all unnecessary files
remove_file "README"
remove_file "public/index.html"
remove_file "public/favicon.ico"
remove_file "public/robots.txt"
remove_file "public/images/rails.png"

git :init

append_file '.gitignore', load_template('gitignore','git')