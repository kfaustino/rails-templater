say "\nWhich Template Engine would you like to use?\n", Thor::Shell::Color::BLUE

template_engine_options = {
  'Option' => 'Template Engine',
  '1' => 'Haml',
  '2' => 'Slim',
  '3' => 'ERB',
}

print_table template_engine_options.to_a, :ident => 4

template_engine_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
if template_engine_options.keys[1..-1].include?(template_engine_selection)
  templater.template_engine.type =  template_engine_options[template_engine_selection].downcase.to_sym
end

$stdout << "\n\n"

apply templater.recipe(templater.template_engine.type)