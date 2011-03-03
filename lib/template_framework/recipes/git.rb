git :init

create_file 'log/.gitkeep'
create_file 'tmp/.gitkeep'
append_file '.gitignore', templater.load_template('gitignore','git')