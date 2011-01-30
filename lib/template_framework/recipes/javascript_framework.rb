say "\nWhich JavaScript Framework would you like to use?\n", Thor::Shell::Color::BLUE

javascript_framework_options = {
  'Option' => 'JavaScript Framework',
  '1' => 'jquery',
  '2' => 'Prototype'
}

print_table javascript_framework_options.to_a, :ident => 4

javascript_framework_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
if javascript_framework_selection.present?
  templater.javascript_framework.type =  javascript_framework_options[javascript_framework_selection].underscore.to_sym
end

$stdout << "\n\n"

apply templater.recipe('jquery') if templater.javascript_framework.jquery?
