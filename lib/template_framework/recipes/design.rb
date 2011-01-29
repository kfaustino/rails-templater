if yes?("\nWould you like to use a design framework? [y|n]: ", Thor::Shell::Color::BLUE)
  design_options = {
    'Option' => 'Design Framework',
    '0' => 'Cancel',
    '1' => 'Compass with blueprint semantic'
  }
  
  print_table design_options.to_a, :ident => 4
  design_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)
  
  design_framework = case design_selection
    when "1"
      :compass
    else
      :none
  end

  if design_framework == :compass
    gem 'compass'

    # TODO: support more than one framework from compass
    compass_sass_dir = "app/stylesheets"
    compass_css_dir = "public/stylesheets/compiled"

    compass_command = "compass init rails . --using blueprint/semantic --css-dir=#{compass_css_dir} --sass-dir=#{compass_sass_dir} "

    templater.post_bundler do
      run compass_command
    end

  end
end
