say "\nWhich Fixture Replacement library would you like to use?\n", Thor::Shell::Color::BLUE

fixture_replacement_options = {
  'Option' => 'Factory Library',
  '1' => 'Fabrication',
  '2' => 'FactoryGirl'
}

print_table fixture_replacement_options.to_a, :ident => 4

fixture_replacement_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
if fixture_replacement_options.keys[1..-1].include?(fixture_replacement_selection)
  templater.fixture_replacement.type =  fixture_replacement_options[fixture_replacement_selection].downcase.underscore.to_sym
end

$stdout << "\n\n"

apply templater.recipe(templater.fixture_replacement.type)