if yes?("\n[Fixture Replacement] Factories over Fixtures? [y|n]: ", Thor::Shell::Color::BLUE)
  options = {
    'Option' => 'Factory Library',
    '1' => 'Fabrication',
    '2' => 'FactoryGirl'
  }

  print_table options.to_a, :ident => 4
  selection = ask("\nOption: ", Thor::Shell::Color::BLUE)

  fixture_replacement = case selection
  when "1"
    apply templater.recipe('fabrication')
  when "2"
    apply templater.recipe('factory_girl')
  end
end
