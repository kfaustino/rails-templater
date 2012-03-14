say "\nWhich JavaScript Framework would you like to use?\n", Thor::Shell::Color::BLUE

javascript_framework_options = {
  'Option' => 'JavaScript Framework',
  '1' => 'jquery',
  '2' => 'prototype'
}

print_table javascript_framework_options.to_a, :ident => 4

javascript_framework_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
if javascript_framework_options.keys[1..-1].include?(javascript_framework_selection)
  templater.javascript_framework.type =  javascript_framework_options[javascript_framework_selection].downcase.to_sym
end

$stdout << "\n\n"

if templater.javascript_framework.jquery?
  gem 'jquery-rails'
else
  gem 'prototype-rails'
end

remove_file 'app/assets/javascripts/application.js'
create_file 'app/assets/javascripts/application.js', templater.load_template('app/assets/javascripts/application.js', templater.javascript_framework.type)
