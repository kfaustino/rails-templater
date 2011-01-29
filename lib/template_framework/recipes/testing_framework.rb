say "\nWhich Testing Framework would you like to use?\n", Thor::Shell::Color::BLUE

testing_framework_options = {
  'Option' => 'Testing Framework',
  '1' => 'rspec',
  '2' => 'TestUnit'
}

print_table testing_framework_options.to_a, :ident => 4

testing_framework_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
templater.testing_framework.type = testing_framework_options[testing_framework_selection].underscore.to_sym

$stdout << "\n\n"

apply templater.recipe('rspec') if templater.testing_framework.rspec?
apply templater.recipe('test_unit') if templater.testing_framework.test_unit?