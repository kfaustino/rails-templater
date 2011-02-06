say "\nWhich Template Engine would you like to use?\n", Thor::Shell::Color::BLUE

template_engine_options = {
  'Option' => 'Template Engine',
  '1' => 'Haml',
  '2' => 'Slim',
  '3' => 'ERB',
}

print_table template_engine_options.to_a, :ident => 4

template_engine_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
if template_engine_selection.present?
  templater.template_engine.type =  template_engine_options[template_engine_selection].downcase.to_sym
end

$stdout << "\n\n"

apply templater.recipe('haml') if templater.template_engine.haml?
apply templater.recipe('slim') if templater.template_engine.slim?
